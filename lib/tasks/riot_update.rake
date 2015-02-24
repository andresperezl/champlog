require "#{Rails.root}/app/helpers/riot_api_helper.rb"
include RiotApiHelper

namespace :riot_update do
  task patches: :environment do
  	puts "Updating patches versions..."
  	patches = JSON.parse HTTParty.get("#{DDRAGON_API}/versions.json").body
  	patches.select{ |p| p.match(/\A[\d\.]+\z/) }.each do |p|
  		Patch.where(name: p).first_or_create
  	end
  	puts "Last Version: #{Patch.order(name: :desc).first.name}"
  end

  task champions: :environment do
  	puts "Gathering champions.."
  	champions = JSON.parse(HTTParty.get(ddragon_champion).body)["data"]
  	puts "Updating #{champions.count} champions..."
  	champions.each do |c|
  		id = c[0]
  		puts "Updating '#{id}'"
  		info = { riot_key: c[1]["key"], title: c[1]["title"], name: c[1]["name"] }
  		champ = Champion.where(riot_id: id).first_or_create
  		champ.update_attributes(info)
  	end
  	puts "Champion basic information updated!"
  end

end
