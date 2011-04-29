class AddPrincipalToSearches < ActiveRecord::Migration
  def self.up
    change_table :searches do |t|
      t.references :principal
    end
  end
  
  def self.down
    remove_column :searches, :principal
  end
end
