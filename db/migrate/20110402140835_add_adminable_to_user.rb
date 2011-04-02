class AddAdminableToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :adminable, :bool
  end

  def self.down
    remove_column :users, :adminable
  end
end
