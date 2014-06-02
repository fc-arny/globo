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

ActiveRecord::Schema.define(version: 20140601211103) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "feedbacks", force: true do |t|
    t.string   "name",                        null: false
    t.string   "email",                       null: false
    t.text     "message",                     null: false
    t.text     "answer"
    t.integer  "user_id"
    t.boolean  "show_in_faq", default: false
    t.integer  "position",    default: 0
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

end
