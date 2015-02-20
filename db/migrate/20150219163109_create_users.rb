class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :summoner_name
      t.integer :summoner_id
      t.string :region
      t.boolean :confirmed
      t.string :confirmation_key
      t.boolean :tester
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
