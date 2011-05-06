class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :commentable_type
      t.integer :commentable_id
      t.string :short_text
      t.string :text
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
