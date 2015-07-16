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

ActiveRecord::Schema.define(version: 20150715155323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reservations", force: :cascade do |t|
    t.integer  "owner_id",                   null: false
    t.integer  "renter_id",                  null: false
    t.integer  "shop_id",                    null: false
    t.date     "start_day",                  null: false
    t.date     "end_day",                    null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "approved",   default: false
  end

  add_index "reservations", ["owner_id"], name: "index_reservations_on_owner_id", using: :btree
  add_index "reservations", ["renter_id"], name: "index_reservations_on_renter_id", using: :btree
  add_index "reservations", ["shop_id"], name: "index_reservations_on_shop_id", using: :btree

  create_table "shops", force: :cascade do |t|
    t.integer  "owner_id",    null: false
    t.string   "address",     null: false
    t.string   "city",        null: false
    t.text     "description"
    t.integer  "price",       null: false
    t.integer  "size",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "shops", ["city"], name: "index_shops_on_city", using: :btree
  add_index "shops", ["owner_id"], name: "index_shops_on_owner_id", using: :btree
  add_index "shops", ["price"], name: "index_shops_on_price", using: :btree
  add_index "shops", ["size"], name: "index_shops_on_size", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "fname"
    t.string   "lname"
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["fname"], name: "index_users_on_fname", using: :btree
  add_index "users", ["lname"], name: "index_users_on_lname", using: :btree

end
