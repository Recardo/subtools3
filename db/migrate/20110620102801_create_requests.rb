class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.references :principal
      t.datetime :date, :default => Time.now
      t.string :type
      t.timestamps
    end
  end

  def self.down
    drop_table :requests
  end
end
