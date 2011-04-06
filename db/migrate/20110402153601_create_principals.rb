class CreatePrincipals < ActiveRecord::Migration
  def self.up
    create_table :principals do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :principals
  end
end
