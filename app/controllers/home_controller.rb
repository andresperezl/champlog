class HomeController < ApplicationController
  def index
  	response = HTTParty.get(DDRAGON_CHAMPION)
  	@champions = JSON.parse(response.body)["data"]
  end

  def riot
  	render text: "dbc069d5-98d2-4e0d-8c90-fa172d04b10e"
  end
end
