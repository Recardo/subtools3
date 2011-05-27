class AddFieldsToSearch < ActiveRecord::Migration
  def self.up
    add_column :searches, :wage, :decimal, :precision => 10, :scale => 2
  end

  def self.down
    remove_column :searches, :wage
  end
end
