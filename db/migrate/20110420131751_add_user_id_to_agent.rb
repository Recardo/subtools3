class AddUserIdToAgent < ActiveRecord::Migration
  def self.up
    change_table :agents do |t|
      t.references :user
    end
  end

  def self.down
    remove_column :agents,:user_id
  end
end
