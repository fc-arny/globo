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

ActiveRecord::Schema.define(version: 20130805230456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sap_addresses", force: true do |t|
    t.integer  "region_id",  null: false
    t.string   "street",     null: false
    t.string   "title"
    t.string   "comment"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sap_addresses", ["id"], name: "index_sap_addresses_on_id", using: :btree

  create_table "sap_admins", force: true do |t|
    t.string   "name",       null: false
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sap_admins", ["id"], name: "index_sap_admins_on_id", using: :btree

  create_table "sap_categories", force: true do |t|
    t.string   "name",                   null: false
    t.string   "url",                    null: false
    t.integer  "order_pos",  default: 0
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sap_categories", ["id"], name: "index_sap_categories_on_id", using: :btree
  add_index "sap_categories", ["order_pos"], name: "index_sap_categories_on_order_pos", using: :btree

  create_table "sap_category_good", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "good_id"
  end

  add_index "sap_category_good", ["category_id", "good_id"], name: "index_sap_category_good_on_category_id_and_good_id", unique: true, using: :btree

  create_table "sap_customers", force: true do |t|
    t.string   "name",                        null: false
    t.string   "phone",                       null: false
    t.string   "email"
    t.boolean  "is_approved", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sap_customers", ["email"], name: "index_sap_customers_on_email", using: :btree
  add_index "sap_customers", ["id"], name: "index_sap_customers_on_id", using: :btree
  add_index "sap_customers", ["phone"], name: "index_sap_customers_on_phone", using: :btree

  create_table "sap_good_items", force: true do |t|
    t.integer  "good_id",                            null: false
    t.string   "store_gid",                          null: false
    t.decimal  "price",      precision: 2, scale: 0, null: false
    t.integer  "store_id",                           null: false
    t.integer  "order_pos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sap_good_items", ["good_id"], name: "index_sap_good_items_on_good_id", using: :btree
  add_index "sap_good_items", ["id"], name: "index_sap_good_items_on_id", using: :btree
  add_index "sap_good_items", ["store_gid", "store_id"], name: "index_sap_good_items_on_store_gid_and_store_id", unique: true, using: :btree
  add_index "sap_good_items", ["store_id"], name: "index_sap_good_items_on_store_id", using: :btree

  create_table "sap_goods", force: true do |t|
    t.string   "name",                       null: false
    t.text     "description"
    t.boolean  "is_approved", default: true
    t.integer  "value",                      null: false
    t.integer  "measure_id"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sap_goods", ["id"], name: "index_sap_goods_on_id", using: :btree

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
    t.integer  "order_id",                             null: false
    t.integer  "good_item_id",                         null: false
    t.decimal  "value",        precision: 3, scale: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sap_order_items", ["good_item_id"], name: "index_sap_order_items_on_good_item_id", using: :btree
  add_index "sap_order_items", ["order_id", "good_item_id"], name: "index_sap_order_items_on_order_id_and_good_item_id", unique: true, using: :btree
  add_index "sap_order_items", ["order_id"], name: "index_sap_order_items_on_order_id", using: :btree

  create_table "sap_orders", force: true do |t|
    t.string   "state",                              null: false
    t.string   "hash_str",                           null: false
    t.decimal  "sum",        precision: 2, scale: 0
    t.integer  "user_id"
    t.string   "phone"
    t.string   "address"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sap_orders", ["id"], name: "index_sap_orders_on_id", using: :btree

  create_table "sap_regions", force: true do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sap_regions", ["id"], name: "index_sap_regions_on_id", using: :btree

  create_table "sap_stores", force: true do |t|
    t.string   "name",                       null: false
    t.integer  "order_pos",      default: 0
    t.string   "url",                        null: false
    t.integer  "region_id"
    t.time     "work_time_from"
    t.time     "work_time_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sap_stores", ["id"], name: "index_sap_stores_on_id", using: :btree

  create_table "sap_users", force: true do |t|
    t.string   "login",                          null: false
    t.string   "name"
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

  add_index "sap_users", ["id"], name: "index_sap_users_on_id", using: :btree
  add_index "sap_users", ["login"], name: "index_sap_users_on_login", using: :btree

  create_table "sap_vendors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "sap_addresses", "sap_regions", :name => "sap_addresses_region_id_fk", :column => "region_id"

  add_foreign_key "sap_categories", "sap_categories", :name => "sap_categories_parent_id_fk", :column => "parent_id"

  add_foreign_key "sap_good_items", "sap_goods", :name => "sap_good_items_good_id_fk", :column => "good_id"
  add_foreign_key "sap_good_items", "sap_stores", :name => "sap_good_items_store_id_fk", :column => "store_id"

  add_foreign_key "sap_goods", "sap_goods", :name => "sap_goods_parent_id_fk", :column => "parent_id"
  add_foreign_key "sap_goods", "sap_measures", :name => "sap_goods_measure_id_fk", :column => "measure_id"

  add_foreign_key "sap_measures", "sap_measures", :name => "sap_measures_parent_id_fk", :column => "parent_id"

  add_foreign_key "sap_order_items", "sap_good_items", :name => "sap_order_items_good_item_id_fk", :column => "good_item_id"
  add_foreign_key "sap_order_items", "sap_orders", :name => "sap_order_items_order_id_fk", :column => "order_id"

  add_foreign_key "sap_orders", "sap_users", :name => "sap_orders_user_id_fk", :column => "user_id"

  add_foreign_key "sap_regions", "sap_regions", :name => "sap_regions_parent_id_fk", :column => "parent_id"

  add_foreign_key "sap_stores", "sap_regions", :name => "sap_stores_region_id_fk", :column => "region_id"

end
