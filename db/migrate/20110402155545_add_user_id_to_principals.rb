class AddUserIdToPrincipals < ActiveRecord::Migration
  def self.up
    change_table :principals do |t|
      t.references :user
    end
  end

  def self.down
    remove_column :principals,:user_id
  end
end
