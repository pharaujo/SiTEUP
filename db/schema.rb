# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100827025855) do

  create_table "addresses", :force => true do |t|
    t.string  "address",                :null => false
    t.string  "zipcode",   :limit => 8
    t.string  "city"
    t.integer "entity_id"
  end

  create_table "emails", :force => true do |t|
    t.string  "email",     :null => false
    t.integer "entity_id"
  end

  create_table "entities", :force => true do |t|
    t.string  "name",           :null => false
    t.string  "homepage"
    t.integer "nif"
    t.integer "entity_type_id"
    t.integer "main_telephone"
    t.integer "main_email"
    t.integer "main_address"
  end

  add_index "entities", ["nif"], :name => "entity_nif_key", :unique => true

  create_table "entity_types", :force => true do |t|
    t.string "description", :null => false
  end

  create_table "event_types", :force => true do |t|
    t.string "description"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "local"
    t.text     "notes"
    t.float    "revenue"
    t.boolean  "paid"
    t.boolean  "confirmed"
    t.boolean  "public"
    t.integer  "event_type_id"
    t.integer  "entity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.string  "nickname",                                     :null => false
    t.string  "student_number", :limit => 9
    t.integer "nbi"
    t.integer "godfather_id"
    t.integer "entity_id"
    t.string  "marital_status",              :default => "S"
    t.integer "programme_id"
  end

  add_index "members", ["nbi"], :name => "member_nbi_key", :unique => true
  add_index "members", ["student_number"], :name => "member_student_number_key", :unique => true

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programmes", :force => true do |t|
    t.string "description"
  end

  create_table "telephones", :force => true do |t|
    t.integer "telephone", :null => false
    t.integer "entity_id"
  end

  create_table "users", :force => true do |t|
    t.string   "username",                           :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
  end

end
