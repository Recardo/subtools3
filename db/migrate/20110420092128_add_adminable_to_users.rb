class AddAdminableToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :adminable, :boolean
  end

  def self.down
    remove_column :users, :adminable
  end
end
