class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.string :expected
      t.string :experienced
      t.decimal :rate, precision: 3, scale: 2
      t.references :patch, index: true
      t.string :steps
      t.belongs_to :user, index: true
      t.belongs_to :tester, index: true, class_name: 'User'
      t.references :bug_type, index: true

      t.timestamps null: false
    end
    add_foreign_key :bugs, :patches
    add_foreign_key :bugs, :users
    add_foreign_key :bugs, :testers
    add_foreign_key :bugs, :bug_types
  end
end
