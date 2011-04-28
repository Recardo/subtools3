class AddCategoryToProfils < ActiveRecord::Migration
  def self.up
    change_table :profils do |t|
      t.references :category
    end
    add_index :profils, :category_id, :unique => false
  end
  
  def self.down
    remove_column :profils, :category_id
  end
end
