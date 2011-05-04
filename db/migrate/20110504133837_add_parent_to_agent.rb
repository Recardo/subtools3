class AddParentToAgent < ActiveRecord::Migration
  def self.up
    change_table :agents do |t|
      t.integer :parent_id
    end
  end
  
  def self.down
    remove_column :agents, :parent_id
  end
end
