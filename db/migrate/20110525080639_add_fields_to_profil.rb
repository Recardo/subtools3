class AddFieldsToProfil < ActiveRecord::Migration
  def self.up
    add_column :profils, :wage, :decimal, :precision => 10, :scale => 2
  end

  def self.down
    remove_column :profils, :wage
  end
end
