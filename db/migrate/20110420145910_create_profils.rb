class CreateProfils < ActiveRecord::Migration
  def self.up
    create_table :profils do |t|
      t.string :name
      t.boolean :active
      t.references :agent  
      t.timestamps
    end
  end

  def self.down
    drop_table :profils
  end
end
