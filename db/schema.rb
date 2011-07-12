# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110620104748) do

  create_table "addresses", :force => true do |t|
    t.string   "name",        :limit => 32
    t.string   "firstname",   :limit => 32
    t.string   "companyname", :limit => 32
    t.string   "street1",     :limit => 64
    t.string   "street2",     :limit => 64
    t.string   "postalcode",  :limit => 15
    t.string   "city",        :limit => 32
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agents", :force => true do |t|
    t.string   "name",              :limit => 32,                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "address_id"
    t.string   "gender",            :limit => 16
    t.string   "identitycard",      :limit => 32
    t.string   "phone",             :limit => 16
    t.string   "fax",               :limit => 16
    t.string   "mobile",            :limit => 16
    t.string   "bankaccountholder", :limit => 32
    t.string   "bankaccount",       :limit => 16
    t.string   "bankcode",          :limit => 16
    t.string   "swift",             :limit => 16
    t.string   "iban",              :limit => 16
    t.datetime "birthday"
    t.integer  "parent_id"
    t.boolean  "agency",                          :default => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name",       :limit => 32, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.string   "text"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean  "all_day",          :default => true
    t.text     "description"
    t.integer  "event_owner_id"
    t.string   "event_owner_type", :default => "Agent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "principals", :force => true do |t|
    t.string   "name",       :limit => 32, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "address_id"
  end

  create_table "profils", :force => true do |t|
    t.string   "name",        :limit => 32,                                                  :null => false
    t.boolean  "active",                                                   :default => true
    t.integer  "agent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.decimal  "wage",                      :precision => 10, :scale => 2
  end

  add_index "profils", ["category_id"], :name => "index_profils_on_category_id"

  create_table "rails_admin_histories", :force => true do |t|
    t.string   "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_histories_on_item_and_table_and_month_and_year"

  create_table "request_positions", :force => true do |t|
    t.integer  "request_id"
    t.integer  "profil_id"
    t.decimal  "wage",        :precision => 10, :scale => 2
    t.integer  "status",                                     :default => 10
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", :force => true do |t|
    t.integer  "principal_id"
    t.datetime "date",         :default => '2011-07-11 09:32:45'
    t.string   "type"
    t.integer  "status",       :default => 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "searches", :force => true do |t|
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "principal_id"
    t.decimal  "wage",         :precision => 10, :scale => 2
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "vatregno",             :limit => 14
    t.string   "email",                               :default => "",    :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",    :null => false
    t.string   "password_salt",                       :default => "",    :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                               :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
