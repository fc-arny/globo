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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130701005859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sap_addresses", force: true do |t|
    t.integer  "region_id"
    t.string   "street"
    t.string   "title"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sap_admins", force: true do |t|
    t.integer  "city_id"
    t.string   "name",       null: false
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sap_categories", force: true do |t|
    t.string   "name",                   null: false
    t.string   "url",                    null: false
    t.integer  "order_pos",  default: 0
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sap_category_good", force: true do |t|
    t.integer "category_id"
    t.integer "good_id"
  end

  create_table "sap_customers", force: true do |t|
    t.string   "phone",                      null: false
    t.string   "name"
    t.boolean  "is_proved",  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sap_good_items", force: true do |t|
    t.integer  "good_id",          null: false
    t.string   "good_id_in_store", null: false
    t.decimal  "price",            null: false
    t.integer  "store_id",         null: false
    t.integer  "order_pos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sap_goods", force: true do |t|
    t.string   "name",                          null: false
    t.integer  "measure_id",                    null: false
    t.integer  "measure_value",                 null: false
    t.integer  "measure_step",  default: 1,     null: false
    t.text     "description"
    t.boolean  "is_approved",   default: false
    t.integer  "order_por",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sap_managers", force: true do |t|
    t.integer  "store_id",   null: false
    t.integer  "last_name",  null: false
    t.integer  "first_name", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sap_measures", force: true do |t|
    t.string  "name",            null: false
    t.integer "step",            null: false
    t.integer "value_in_parent"
    t.integer "parent_id"
  end

  create_table "sap_order_items", force: true do |t|
    t.integer  "order_id"
    t.integer  "good_item_id"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sap_order_items", ["order_id", "good_item_id"], name: "index_sap_order_items_on_order_id_and_good_item_id", unique: true, using: :btree

  create_table "sap_orders", force: true do |t|
    t.string   "state"
    t.string   "hash_str"
    t.decimal  "sum"
    t.integer  "user_id"
    t.integer  "phone_id",   :comment => "Link to phone"
    t.string   "address",    :comment => "Address string: area, street, house number and etc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sap_regions", force: true do |t|
    t.string   "name"
    t.string   "state"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sap_stores", force: true, :comment => "List of stores" do |t|
    t.string   "name",                       null: false
    t.integer  "order_pos",      default: 0
    t.string   "url",                        null: false
    t.string   "region_id"
    t.time     "work_time_from"
    t.time     "work_time_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sap_users", force: true do |t|
    t.string   "login",                          null: false, :comment => "secret key = md5(md5(password) + salt)"
    t.string   "password",                       null: false
    t.string   "salt",                           null: false
    t.boolean  "is_temporary",   default: false
    t.string   "token"
    t.datetime "valid_token_to"
    t.integer  "role_id"
    t.string   "role_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sap_vendors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "sap_goods", "sap_measures", :name => "sap_goods_measure_id_fk", :column => "measure_id"

  add_foreign_key "sap_measures", "sap_measures", :name => "sap_measures_parent_id_fk", :column => "parent_id"

end
