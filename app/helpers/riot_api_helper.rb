module RiotApiHelper
	include ERB::Util

	RIOT_API_KEY = Rails.application.secrets.riot_api_key
	API_KEY_PARAM = "&api_key=#{RIOT_API_KEY}"
	DDRAGON_BASE = "https://ddragon.leagueoflegends.com"
	DDRAGON_API = "#{DDRAGON_BASE}/api"
	DDRAGON_VERSION = JSON.parse(HTTParty.get("#{DDRAGON_API}/versions.json").body)[0]

	DDRAGON_CDN = "#{DDRAGON_BASE}/cdn/#{DDRAGON_VERSION}"

	DDRAGON_DATA = "#{DDRAGON_CDN}/data/en_US"
	DDRAGON_CHAMPION = "#{DDRAGON_DATA}/champion.json"

	DDRAGON_IMG = "#{DDRAGON_CDN}/img"
	DDRAGON_SPRITE = "#{DDRAGON_IMG}/sprite"

	API_BASE = "api.pvp.net/api/lol"

	SUMMONER_VERSION = "1.4"

	def summoner_base(region)
		"https://#{region}.#{API_BASE}/#{region}/v#{SUMMONER_VERSION}/summoner"
	end

	def summoner_by_name(region, summoner_name)
		response = HTTParty.get("#{summoner_base(region)}/by-name/#{u summoner_name}?#{API_KEY_PARAM}")
		JSON.parse(response.body).first[1] if response.code == 200
	end

	def mastery_pages(region, summoner_id)
		response = HTTParty.get("#{summoner_base(region)}/#{summoner_id}/masteries?#{API_KEY_PARAM}")
		JSON.parse(response.body)["#{summoner_id}"]["pages"].map{ |p| p["name"] }
	end
	
	def shards
		JSON.parse HTTParty.get('http://status.leagueoflegends.com/shards').body
	end
end
