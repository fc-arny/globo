# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20121125230719) do

  create_table "admins", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "city_id"
    t.string   "name",       :null => false
    t.string   "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name",                      :null => false
    t.integer  "order_pos",  :default => 0
    t.integer  "parent_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "customers", :force => true do |t|
    t.integer  "user_id"
    t.string   "email"
    t.string   "last_name"
    t.string   "first_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "goods", :force => true do |t|
    t.string   "name",                           :null => false
    t.text     "description"
    t.boolean  "is_approved", :default => false
    t.integer  "order_por",   :default => 0
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "managers", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "store_id",   :null => false
    t.integer  "last_name",  :null => false
    t.integer  "first_name", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stores", :force => true do |t|
    t.string   "name",                           :null => false
    t.integer  "order_pos",   :default => 0
    t.boolean  "is_disabled", :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "login",      :null => false
    t.string   "password",   :null => false
    t.string   "salt",       :null => false
    t.string   "type",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
