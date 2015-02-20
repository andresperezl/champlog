class RenamePasswordToPasswordDigestInUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :password, :password_digest
  	add_column :users, :remember_digest, :string
  end
end
