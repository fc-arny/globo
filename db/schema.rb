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

ActiveRecord::Schema.define(version: 20140430005549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "feedbacks", force: true, comment: "FAQ from contacts" do |t|
    t.string   "name",                        null: false
    t.string   "email",                       null: false
    t.text     "message",                     null: false
    t.text     "answer"
    t.integer  "user_id",                                  comment: "Responsible employee"
    t.boolean  "show_in_faq", default: false,              comment: "Show or not in help page"
    t.integer  "position",    default: 0,                  comment: "Order questions in help page"
    t.integer  "status",      default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "image_thread_images", force: true do |t|
    t.integer  "thread_id"
    t.string   "name",                                    comment: "Displayed file name"
    t.string   "source",                     null: false, comment: "Real file name"
    t.string   "state",      default: "new", null: false, comment: "File state: active, new, deleted, archive"
    t.integer  "order_pos",  default: 0,                  comment: "Order position"
    t.string   "dir",        default: ""
    t.datetime "created_at"
  end

  add_index "image_thread_images", ["thread_id"], name: "index_image_thread_images_on_thread_id", using: :btree

  create_table "image_thread_threads", force: true do |t|
    t.integer  "default_image_id", comment: "Reference to default image of thread"
    t.integer  "owner_id",         comment: "Thread owner"
    t.datetime "created_at"
  end

  add_index "image_thread_threads", ["default_image_id"], name: "index_image_thread_threads_on_default_image_id", using: :btree

  create_table "sp_addresses", force: true, comment: "Addresses table" do |t|
    t.string   "name",                    comment: "Address title.Ex.: home, offece, manny etc"
    t.string   "street",     null: false, comment: "Street, house number etc"
    t.string   "comment",                 comment: "More information for courier"
    t.integer  "region_id",  null: false, comment: "Link to region. Ex.: Moscow"
    t.integer  "owner_id",                comment: "Store or user or everything link"
    t.string   "owner_type",              comment: "Store or user or everything link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sp_blog_categories", force: true, comment: "Blog categories" do |t|
    t.string   "name",       null: false
    t.string   "url",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sp_blog_categories", ["url"], name: "index_sp_blog_categories_on_url", unique: true, using: :btree

  create_table "sp_blog_posts", force: true, comment: "Blog posts" do |t|
    t.string   "title",                          null: false
    t.text     "body",                           null: false
    t.integer  "category_id"
    t.boolean  "published",      default: false,              comment: "Show or not this post in the feed"
    t.datetime "published_date",                              comment: "Posted date for users"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sp_categories", force: true, comment: "Goods categories" do |t|
    t.string   "name",                        null: false, comment: "Category name"
    t.string   "url",                         null: false, comment: "Category url segment"
    t.integer  "position",     default: 0,                 comment: "Sorting value"
    t.boolean  "show_in_menu", default: true,              comment: "Category like tag. If show_in menu os true"
    t.integer  "images_id",                                comment: "Reference to images' album"
    t.string   "ancestry",                                 comment: "Ancestry gem's field for TREE view"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sp_categories", ["ancestry"], name: "index_sp_categories_on_ancestry", using: :btree
  add_index "sp_categories", ["images_id"], name: "index_sp_categories_on_images_id", using: :btree

  create_table "sp_category_goods", id: false, force: true, comment: "Joining table" do |t|
    t.integer "category_id"
    t.integer "good_id"
  end

  add_index "sp_category_goods", ["category_id", "good_id"], name: "index_sp_category_goods_on_category_id_and_good_id", unique: true, using: :btree

  create_table "sp_good_items", force: true, comment: "Goods of store" do |t|
    t.integer  "good_id",                                                null: false, comment: "Real good ID"
    t.string   "store_gid",                                              null: false, comment: "Store inside good's ID for sync list"
    t.decimal  "price",           precision: 8, scale: 2,                null: false, comment: "Price in the store"
    t.integer  "store_id",                                               null: false, comment: "Store ID"
    t.boolean  "is_available",                            default: true,              comment: "Does store have this good"
    t.integer  "position",                                                            comment: "Sorting value"
    t.integer  "image_thread_id",                                                     comment: "Reference to images' album"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sp_good_items", ["good_id"], name: "index_sp_good_items_on_good_id", using: :btree
  add_index "sp_good_items", ["store_gid", "store_id"], name: "index_sp_good_items_on_store_gid_and_store_id", unique: true, using: :btree
  add_index "sp_good_items", ["store_id"], name: "index_sp_good_items_on_store_id", using: :btree

  create_table "sp_goods", force: true, comment: "All goods from all stores" do |t|
    t.string   "name",                            null: false, comment: "Goods name"
    t.text     "description",                                  comment: "Goods's description"
    t.integer  "value",                           null: false, comment: "How many gram or priece in one item"
    t.integer  "measure_id",                                   comment: "Good's measure: kilo, pack, bar etc"
    t.integer  "category_id",                                  comment: "Good's category"
    t.boolean  "is_group",        default: false,              comment: "Group of same product in defferent packs"
    t.integer  "group_id",                                     comment: "Reference to group"
    t.integer  "image_thread_id",                              comment: "Reference to images' album"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sp_measures", force: true do |t|
    t.string  "name",            null: false
    t.integer "step",            null: false
    t.integer "value_in_parent"
    t.integer "parent_id"
  end

  create_table "sp_order_items", id: false, force: true, comment: "GoodList of order" do |t|
    t.integer  "order_id",                             null: false, comment: "Order ID"
    t.integer  "good_item_id",                         null: false, comment: "Good(item) ID"
    t.integer  "value",                                null: false, comment: "Good value. Ex.: 100 packs or 1500 gram"
    t.decimal  "price",        precision: 8, scale: 2,              comment: "Current price for product"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sp_order_items", ["order_id", "good_item_id"], name: "index_sp_order_items_on_order_id_and_good_item_id", unique: true, using: :btree
  add_index "sp_order_items", ["order_id"], name: "index_sp_order_items_on_order_id", using: :btree

  create_table "sp_orders", force: true, comment: "Order model" do |t|
    t.string   "state",                              null: false, comment: "Order state - new, payed etc"
    t.string   "hash_str",                           null: false, comment: "Hash for order access"
    t.decimal  "sum",        precision: 2, scale: 0
    t.integer  "user_id",                                         comment: "Customer.user_id - link to user"
    t.string   "phone",                                           comment: "Phone string"
    t.string   "address",                                         comment: "Address string"
    t.string   "comment",                                         comment: "Order comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sp_regions", force: true, comment: "Regions.ex Moscow(chld: Reutov, Rublevo, Lyubertsy etc)" do |t|
    t.string   "name",        null: false, comment: "Region name"
    t.string   "description",              comment: "Description for region"
    t.integer  "parent_id",                comment: "Big region can have smaller subregions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sp_sms", force: true do |t|
    t.integer  "number"
    t.string   "message"
    t.datetime "created"
    t.string   "provider"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sp_stores", force: true do |t|
    t.string   "name",                           null: false, comment: "Store's name"
    t.integer  "position",       default: 0,                  comment: "Value for sorting stores"
    t.string   "url",                            null: false, comment: "Url segment"
    t.string   "system_name",                                 comment: "Internal name of store"
    t.boolean  "active",         default: false,              comment: "Work with this store or not"
    t.integer  "region_id",                                   comment: "Link to region"
    t.time     "work_time_from",                              comment: "Store start work"
    t.time     "work_time_to",                                comment: "Store stop work"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sp_users", force: true, comment: "Base model for all users" do |t|
    t.string   "name",                                                comment: "All users should have name. Generated name"
    t.string   "login",                                  null: false, comment: "User login"
    t.string   "email",                                               comment: "User email"
    t.string   "phone",                                  null: false, comment: "Customer phone"
    t.string   "role",                                                comment: "User role in backend"
    t.string   "encrypted_password",                     null: false, comment: "Password hash"
    t.boolean  "is_temporary",           default: false,              comment: "Is temporary user(create temp customers)"
    t.string   "authentication_token",                                comment: "Auth by token"
    t.datetime "remember_created_at",                                 comment: "Remember me"
    t.string   "reset_password_token",                                comment: "Token for reseting password"
    t.string   "reset_password_code",                                 comment: "Sms with code for reset"
    t.datetime "reset_password_sent_at",                              comment: "When token created"
    t.string   "reset_phone_new",                                     comment: "New user phone"
    t.string   "reset_phone_code",                                    comment: "Code sent by sms"
    t.datetime "reset_phone_sent_at",                                 comment: "When code created"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sp_users", ["authentication_token"], name: "index_sp_users_on_authentication_token", unique: true, using: :btree
  add_index "sp_users", ["email"], name: "index_sp_users_on_email", unique: true, using: :btree
  add_index "sp_users", ["login"], name: "index_sp_users_on_login", unique: true, using: :btree
  add_index "sp_users", ["phone"], name: "index_sp_users_on_phone", unique: true, using: :btree

  create_table "sp_vendors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "image_thread_images", "image_thread_threads", name: "image_thread_images_thread_id_fk", column: "thread_id", dependent: :nullify

  add_foreign_key "image_thread_threads", "image_thread_images", name: "image_thread_threads_default_image_id_fk", column: "default_image_id", dependent: :nullify

  add_foreign_key "sp_addresses", "sp_regions", name: "sp_addresses_region_id_fk", column: "region_id"

  add_foreign_key "sp_blog_posts", "sp_blog_categories", name: "sp_blog_posts_category_id_fk", column: "category_id"

  add_foreign_key "sp_categories", "image_thread_threads", name: "sp_categories_images_id_fk", column: "images_id"

  add_foreign_key "sp_good_items", "sp_goods", name: "sp_good_items_good_id_fk", column: "good_id"
  add_foreign_key "sp_good_items", "sp_stores", name: "sp_good_items_store_id_fk", column: "store_id"

  add_foreign_key "sp_goods", "sp_categories", name: "sp_goods_category_id_fk", column: "category_id"
  add_foreign_key "sp_goods", "sp_goods", name: "sp_goods_group_id_fk", column: "group_id"
  add_foreign_key "sp_goods", "sp_measures", name: "sp_goods_measure_id_fk", column: "measure_id"

  add_foreign_key "sp_measures", "sp_measures", name: "sp_measures_parent_id_fk", column: "parent_id"

  add_foreign_key "sp_order_items", "sp_good_items", name: "sp_order_items_good_item_id_fk", column: "good_item_id"
  add_foreign_key "sp_order_items", "sp_orders", name: "sp_order_items_order_id_fk", column: "order_id"

  add_foreign_key "sp_orders", "sp_users", name: "sp_orders_user_id_fk", column: "user_id"

  add_foreign_key "sp_regions", "sp_regions", name: "sp_regions_parent_id_fk", column: "parent_id"

  add_foreign_key "sp_stores", "sp_regions", name: "sp_stores_region_id_fk", column: "region_id"

end
