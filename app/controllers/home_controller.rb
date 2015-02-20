class HomeController < ApplicationController
  def index
  	response = HTTParty.get(DDRAGON_CHAMPION)
  	@champions = JSON.parse(response.body)["data"]
  end
end
