class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :name
      t.string :note

      t.timestamps null: false
    end
  end
end
