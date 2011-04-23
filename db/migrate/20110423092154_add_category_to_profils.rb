class AddCategoryToProfils < ActiveRecord::Migration
  def self.up
    change_table :profils do |t|
      t.references :category
    end
  end
  
  def self.down
    remove_column :profils, :category
  end
end
