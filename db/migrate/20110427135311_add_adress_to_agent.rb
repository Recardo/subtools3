class AddAdressToAgent < ActiveRecord::Migration
  def self.up
    change_table :agents do |t|
      t.references :address
    end
  end

  def self.down
    remove_column :agents,:address_id
  end
end
