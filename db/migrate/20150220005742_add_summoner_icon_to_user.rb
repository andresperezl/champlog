class AddSummonerIconToUser < ActiveRecord::Migration
  def change
    add_column :users, :summoner_icon, :integer
  end
end
