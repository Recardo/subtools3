class AddAdminableToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :adminable, :boolean, :default => false
  end

  def self.down
    remove_column :users, :adminable
  end
end
