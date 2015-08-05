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

ActiveRecord::Schema.define(version: 20150730061745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "associations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "associations", ["group_id"], name: "index_associations_on_group_id", using: :btree
  add_index "associations", ["user_id"], name: "index_associations_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.boolean  "complete",    default: false
    t.date     "created"
    t.integer  "priority"
    t.string   "image_url"
    t.integer  "list_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "description"
  end

  create_table "lists", force: :cascade do |t|
    t.string   "name"
    t.date     "created"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "group_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "item_id"
    t.string   "message"
    t.string   "phone"
    t.string   "recemail"
    t.datetime "send_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "list_id"
    t.string   "item_name"
  end

  create_table "tokens", force: :cascade do |t|
    t.string   "access_token"
    t.string   "refresh_token"
    t.datetime "expires_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image"
    t.string   "full_name"
    t.string   "google_profile"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "username"
    t.string   "password"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthday"
    t.boolean  "is_admin",             default: false
    t.boolean  "is_owner",             default: false
    t.string   "avatar"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "password_reset_token"
    t.string   "phone"
  end

  add_foreign_key "associations", "groups"
  add_foreign_key "associations", "users"
end
