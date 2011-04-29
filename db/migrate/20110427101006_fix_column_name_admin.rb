class FixColumnNameAdmin < ActiveRecord::Migration
  def self.up
    rename_column :users, :adminable, :admin
  end

  def self.down
    rename_column :users, :admin, :adminable
  end
end
