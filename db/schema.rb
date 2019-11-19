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

ActiveRecord::Schema.define(version: 20191118062559) do

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image",      null: false
    t.integer  "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "item_name",                     null: false
    t.text     "description",     limit: 65535, null: false
    t.integer  "item_condition",                null: false
    t.string   "trade_status",                  null: false
    t.string   "size"
    t.integer  "bland_id"
    t.integer  "category_id",                   null: false
    t.string   "delivery_charge",               null: false
    t.string   "delivery_methot",               null: false
    t.string   "delivery_area",                 null: false
    t.string   "delivery_time",                 null: false
    t.integer  "price",                         null: false
    t.integer  "user_id",                       null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "firstname",                           null: false
    t.string   "firstname_kana",                      null: false
    t.string   "lastname",                            null: false
    t.string   "lastname_kana",                       null: false
    t.string   "nickname",                            null: false
    t.date     "birthday",                            null: false
    t.bigint   "total_profit",           default: 0
    t.bigint   "point",                  default: 0
    t.string   "user_profile"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
