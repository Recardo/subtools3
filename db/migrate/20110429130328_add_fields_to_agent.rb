class AddFieldsToAgent < ActiveRecord::Migration
  def self.up
    change_table :agents do |t|
      t.string :gender, :limit => 16
      t.string :identitycard, :limit => 32
      t.string :phone, :limit => 16
      t.string :fax, :limit => 16
      t.string :mobile, :limit => 16
      t.string :bankaccountholder, :limit => 32
      t.string :bankaccount, :limit => 16
      t.string :bankcode, :limit => 16
      t.string :swift, :limit => 16
      t.string :iban, :limit => 16
      t.datetime :birthday
    end
  end

  def self.down
    remove_column :agents,:gender
    remove_column :agents,:identitycard
    remove_column :agents,:phone
    remove_column :agents,:fax
    remove_column :agents,:mobile
    remove_column :agents,:bankaccountholder
    remove_column :agents,:bankaccount
    remove_column :agents,:bankcode
    remove_column :agents,:swift
    remove_column :agents,:iban
    remove_column :agents,:birthday
  end
end
