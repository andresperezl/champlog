class User < ActiveRecord::Base
	include RiotApiHelper

	attr_accessor :remember_token	

	before_validation {
		summ = User.where("region = ? AND LOWER(summoner_name) = ?",
		 region, summoner_name.downcase).first
		unless summ.nil?
			summ.delete if (summ.created_at + 1.hour) < Time.now && !summ.confirmed
		end
	}

	has_secure_password
#	validates :email, presence: true, uniqueness: { case_sensitive: false }, email: true, length: { in: 7..254 }
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
	validates :summoner_name, presence: true, allow_blank: false,
	uniqueness: { scope: :region, case_sensitive: false,
	 message: "This summoner name have already been claimmed by another user." }, format: { with: /\A[^,]+\z/ }
	validate :region_must_exists
	validate :summoner_must_exist_in_riot

	before_create { 
#		self.email = email.downcase
		self.summoner_name = @info["name"]
		self.summoner_id = @info["id"]
		self.summoner_icon = @info["profileIconId"]
		self.confirmation_key = User.new_token
		self.verify_timeout = Time.now
	}

	def summoner_must_exist_in_riot
		@info = summoner_by_name(region, summoner_name)
		if @info.nil?
			errors.add(:summoner_name, "#{summoner_name} does NOT exist in #{region}") 
		elsif @info["summonerLevel"] < 30
			errors.add(:summoner_name, "#{summoner_name} have not reached level 30 yet")
		end
	end

	def region_must_exists
		errors.add(:region, "#{region} is not a valid Riot support region") unless shards.map{ |shard| shard['slug'] }.include?(region)
	end

	# Returns a random token.
	def User.new_token
		SecureRandom.urlsafe_base64
	end

	# Returns the hash digest of the given string.
	def User.digest(string)
	    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	                                                  BCrypt::Engine.cost
	    BCrypt::Password.create(string, cost: cost)
	end

	# Remembers a user in the database for use in persistent sessions.
    def remember
    	self.remember_token = User.new_token
    	update_attribute(:remember_digest, User.digest(remember_token))
    end

    # Returns true if the given token matches the digest.
  	def authenticated?(remember_token)
  		return false if remember_digest.nil?
    	BCrypt::Password.new(remember_digest).is_password?(remember_token)
  	end

  	# Forgets a user.
	def forget
	    update_attribute(:remember_digest, nil)
	end

	#Verify user
	def verify?
		pages = mastery_pages(self.region, self.summoner_id)
		pages.include?(self.confirmation_key)
	end

	def verified?
		confirmed
	end

end
