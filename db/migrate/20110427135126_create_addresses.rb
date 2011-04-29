class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :name, :limit => 32
      t.string :firstname, :limit => 32
      t.string :companyname, :limit => 32
      t.string :street1, :limit => 64
      t.string :street2, :limit => 64
      t.string :postalcode, :limit => 15
      t.string :city, :limit => 32

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
