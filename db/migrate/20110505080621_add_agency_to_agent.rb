class AddAgencyToAgent < ActiveRecord::Migration
  def self.up
    add_column :agents, :agency, :boolean, :default => false
  end
  
  def self.down
    remove_column :agents, :agency
  end
end
