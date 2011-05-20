class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :all_day, :default => true
      t.text :description
      t.references :event_owner, :polymorphic => { :default => 'Agent' }

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
