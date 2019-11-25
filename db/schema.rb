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


ActiveRecord::Schema.define(version: 20191122011259) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "prefecture_id", null: false
    t.string   "city",          null: false
    t.string   "address",       null: false
    t.string   "building_name"
    t.string   "phone_number"
    t.integer  "user_id",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end


  create_table "blands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_blands_on_category_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry", using: :btree
  end

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
    t.integer  "trade_status",                  null: false
    t.integer  "size"
    t.integer  "bland_id"
    t.integer  "category_id",                   null: false
    t.integer  "delivery_charge",               null: false
    t.integer  "delivery_method",               null: false
    t.integer  "delivery_area",                 null: false
    t.integer  "delivery_time",                 null: false
    t.integer  "price",                         null: false
    t.integer  "user_id",                       null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",                                        null: false
    t.string   "first_name_kana",                                   null: false
    t.string   "last_name",                                         null: false
    t.string   "last_name_kana",                                    null: false
    t.string   "nickname",                                          null: false
    t.string   "email",                                             null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.integer  "birthdate_year",                                    null: false
    t.integer  "birthdate_month",                                   null: false
    t.integer  "birthdate_day",                                     null: false
    t.bigint   "total_profit",                         default: 0
    t.bigint   "point",                                default: 0
    t.integer  "phone_number",                                      null: false
    t.text     "user_profile",           limit: 65535
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
