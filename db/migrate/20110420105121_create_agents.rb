class CreateAgents < ActiveRecord::Migration
  def self.up
    create_table :agents do |t|
      t.string :name, :null => false, :limit => 32

      t.timestamps
    end
  end

  def self.down
    drop_table :agents
  end
end
