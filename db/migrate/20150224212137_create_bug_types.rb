class CreateBugTypes < ActiveRecord::Migration
  def change
    create_table :bug_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
