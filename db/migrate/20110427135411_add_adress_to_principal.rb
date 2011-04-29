class AddAdressToPrincipal < ActiveRecord::Migration
  def self.up
    change_table :principals do |t|
      t.references :address
    end
  end

  def self.down
    remove_column :principals,:address_id
  end
end
