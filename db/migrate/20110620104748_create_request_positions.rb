class CreateRequestPositions < ActiveRecord::Migration
  def self.up
    create_table :request_positions do |t|
      t.references :request
      t.references :profil
      t.decimal :wage, :precision => 10, :scale => 2
      t.integer :status, :default => 10 
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :request_positions
  end
end
