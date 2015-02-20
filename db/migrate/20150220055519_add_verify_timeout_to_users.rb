class AddVerifyTimeoutToUsers < ActiveRecord::Migration
  def change
    add_column :users, :verify_timeout, :timestamp
  end
end
