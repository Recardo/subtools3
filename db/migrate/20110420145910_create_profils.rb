class CreateProfils < ActiveRecord::Migration
  def self.up
    create_table :profils do |t|
      t.string :name, :null => false, :limit => 32
      t.boolean :active, :default => true
      t.references :agent
      t.timestamps
    end
  end

  def self.down
    drop_table :profils
  end
end
