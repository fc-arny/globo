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

ActiveRecord::Schema.define(version: 20130701231861) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sap_addresses", force: true, :comment => "Addresses table" do |t|
    t.integer  "region_id",  null: false, :comment => "Link to region. Ex.: Moscow"
    t.string   "street",     null: false, :comment => "Street, house number etc"
    t.string   "title",                   :comment => "Address title.Ex.: home, offece, manny etc"
    t.string   "comment",                 :comment => "More information for courier"
    t.integer  "owner_id",                :comment => "Store or user link"
    t.string   "owner_type",              :comment => "Store or user link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sap_addresses", ["id"], name: "index_sap_addresses_on_id", using: :btree

  create_table "sap_admins", force: true, :comment => "Admin users" do |t|
    t.string   "name",       null: false, :comment => "Admin name"
    t.string   "position",                :comment => "Position in company(ex.: CEO, CTO, CFO)"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sap_admins", ["id"], name: "index_sap_admins_on_id", using: :btree

  create_table "sap_categories", force: true, :comment => "Goods categories" do |t|
    t.string   "name",                   null: false, :comment => "Category name"
    t.string   "url",                    null: false, :comment => "Category url segment"
    t.integer  "order_pos",  default: 0,              :comment => "Sorting value"
    t.integer  "parent_id",                           :comment => "Parent category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sap_categories", ["id"], name: "index_sap_categories_on_id", using: :btree
  add_index "sap_categories", ["order_pos"], name: "index_sap_categories_on_order_pos", using: :btree

  create_table "sap_category_good", force: true, :comment => "Intervening table" do |t|
    t.integer "category_id_id"
    t.integer "good_id_id"
  end

  create_table "sap_customers", force: true, :comment => "Customers" do |t|
    t.string   "name",                        null: false, :comment => "Customer name"
    t.string   "phone",                       null: false, :comment => "Customer phone"
    t.string   "email",                                    :comment => "Customer email"
    t.boolean  "is_approved", default: false,              :comment => "Is customer approved"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sap_customers", ["email"], name: "index_sap_customers_on_email", using: :btree
  add_index "sap_customers", ["id"], name: "index_sap_customers_on_id", using: :btree
  add_index "sap_customers", ["phone"], name: "index_sap_customers_on_phone", using: :btree

  create_table "sap_good_items", force: true, :comment => "Goods of store" do |t|
    t.integer  "good_id",          null: false, :comment => "Real good ID"
    t.string   "good_id_in_store", null: false, :comment => "Store inside good's ID for sync list"
    t.decimal  "price",            null: false, :comment => "Price in the store"
    t.integer  "store_id",         null: false, :comment => "Store ID"
    t.integer  "order_pos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sap_good_items", ["good_id"], name: "index_sap_good_items_on_good_id", using: :btree
  add_index "sap_good_items", ["good_id_in_store", "store_id"], name: "index_sap_good_items_on_good_id_in_store_and_store_id", unique: true, using: :btree
  add_index "sap_good_items", ["id"], name: "index_sap_good_items_on_id", using: :btree
  add_index "sap_good_items", ["store_id"], name: "index_sap_good_items_on_store_id", using: :btree

  create_table "sap_goods", force: true, :comment => "All goods from all stores" do |t|
    t.string   "name",                         null: false, :comment => "Goods name"
    t.text     "description",                               :comment => "Goods's description"
    t.boolean  "is_approved",   default: true,              :comment => "Is good blocked by admin"
    t.integer  "order_pos",     default: 0,                 :comment => "Sorting value"
    t.integer  "measure_id",                   null: false
    t.integer  "measure_value",                null: false
    t.integer  "measure_step",  default: 1,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sap_goods", ["id"], name: "index_sap_goods_on_id", using: :btree
  add_index "sap_goods", ["order_pos"], name: "index_sap_goods_on_order_pos", using: :btree

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

  create_table "sap_order_items", force: true, :comment => "GoodList of order" do |t|
    t.integer  "order_id",     null: false, :comment => "Order ID"
    t.integer  "good_item_id", null: false, :comment => "GoodItem ID"
    t.integer  "value",        null: false, :comment => "Good value. Ex.: 100 packs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sap_order_items", ["good_item_id"], name: "index_sap_order_items_on_good_item_id", using: :btree
  add_index "sap_order_items", ["order_id", "good_item_id"], name: "index_sap_order_items_on_order_id_and_good_item_id", unique: true, using: :btree
  add_index "sap_order_items", ["order_id"], name: "index_sap_order_items_on_order_id", using: :btree

  create_table "sap_orders", force: true, :comment => "Order model" do |t|
    t.string   "state",      null: false, :comment => "Order state - new, payed etc"
    t.string   "hash_str",   null: false, :comment => "Hash for order access"
    t.decimal  "sum"
    t.integer  "user_id",                 :comment => "Customer.user_id - link to user"
    t.string   "phone",      null: false, :comment => "Phone string"
    t.string   "address",    null: false, :comment => "Address string"
    t.string   "comment",                 :comment => "Order comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sap_orders", ["id"], name: "index_sap_orders_on_id", using: :btree

  create_table "sap_regions", force: true, :comment => "Regions.ex Moscow(chld: Reutov, Rublevo, Lyubertsy etc)" do |t|
    t.string   "name",        null: false, :comment => "Region name"
    t.string   "description",              :comment => "Description for region"
    t.integer  "parent_id",                :comment => "Big region can have smaller subregions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sap_regions", ["id"], name: "index_sap_regions_on_id", using: :btree

  create_table "sap_stores", force: true, :comment => "List of stores" do |t|
    t.string   "name",                       null: false, :comment => "Store's name"
    t.integer  "order_pos",      default: 0,              :comment => "Value for sorting stores"
    t.string   "url",                        null: false, :comment => "Url segment"
    t.integer  "region_id",                               :comment => "Link to region"
    t.time     "work_time_from",                          :comment => "Store start work"
    t.time     "work_time_to",                            :comment => "Store stop work"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sap_stores", ["id"], name: "index_sap_stores_on_id", using: :btree

  create_table "sap_users", force: true, :comment => "Base model for all users" do |t|
    t.string   "login",                          null: false, :comment => "Login string"
    t.string   "name",                                        :comment => "All users should have name. Generated name"
    t.string   "password",                       null: false, :comment => "Password: secret key = md5(md5(password) + salt)"
    t.string   "salt",                           null: false, :comment => "Salt - random string for security"
    t.boolean  "is_temporary",   default: false,              :comment => "Is temporary user(create temp customers)"
    t.string   "token",                                       :comment => "Token for reset password"
    t.datetime "valid_token_to",                              :comment => "Token expiration date"
    t.integer  "role_id",                                     :comment => "User role - admin, manager or customer"
    t.string   "role_type",                                   :comment => "User role - admin, manager or customer"
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

  add_foreign_key "sap_goods", "sap_measures", :name => "sap_goods_measure_id_fk", :column => "measure_id"

  add_foreign_key "sap_measures", "sap_measures", :name => "sap_measures_parent_id_fk", :column => "parent_id"

  add_foreign_key "sap_order_items", "sap_good_items", :name => "sap_order_items_good_item_id_fk", :column => "good_item_id"
  add_foreign_key "sap_order_items", "sap_orders", :name => "sap_order_items_order_id_fk", :column => "order_id"

  add_foreign_key "sap_orders", "sap_users", :name => "sap_orders_user_id_fk", :column => "user_id"

  add_foreign_key "sap_regions", "sap_regions", :name => "sap_regions_parent_id_fk", :column => "parent_id"

  add_foreign_key "sap_stores", "sap_regions", :name => "sap_stores_region_id_fk", :column => "region_id"

end
