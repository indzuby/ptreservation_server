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

ActiveRecord::Schema.define(version: 20160703125330) do

  create_table "companies", force: :cascade do |t|
    t.string   "name",       limit: 255,             null: false
    t.string   "tel",        limit: 255,             null: false
    t.string   "address",    limit: 255,             null: false
    t.string   "url",        limit: 255
    t.integer  "is_delete",  limit: 4,   default: 0, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "companies", ["name"], name: "index_companies_on_name", unique: true, using: :btree

  create_table "customers", force: :cascade do |t|
    t.integer  "is_delete",  limit: 4, default: 0, null: false
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "pt_count",   limit: 4, default: 0, null: false
    t.integer  "trainer_id", limit: 4
  end

  add_index "customers", ["user_id"], name: "index_customers_on_user_id", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.integer  "is_delete",      limit: 4,   default: 0, null: false
    t.integer  "trainer_id",     limit: 4
    t.integer  "customer_id",    limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.datetime "start_datetime",                         null: false
    t.datetime "end_datetime",                           null: false
    t.string   "memo",           limit: 255
  end

  add_index "reservations", ["customer_id"], name: "index_reservations_on_customer_id", using: :btree
  add_index "reservations", ["trainer_id"], name: "index_reservations_on_trainer_id", using: :btree

  create_table "tokens", force: :cascade do |t|
    t.integer  "is_delete",    limit: 4,   default: 0, null: false
    t.integer  "user_id",      limit: 4
    t.string   "device_token", limit: 255
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "tokens", ["user_id"], name: "index_tokens_on_user_id", using: :btree

  create_table "trainers", force: :cascade do |t|
    t.integer  "is_delete",  limit: 4, default: 0, null: false
    t.integer  "user_id",    limit: 4
    t.integer  "company_id", limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "trainers", ["company_id"], name: "index_trainers_on_company_id", using: :btree
  add_index "trainers", ["user_id"], name: "index_trainers_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",       limit: 255,             null: false
    t.string   "password",    limit: 255,             null: false
    t.string   "name",        limit: 255,             null: false
    t.string   "tel",         limit: 255
    t.integer  "sex",         limit: 4,               null: false
    t.integer  "isDelete",    limit: 4,   default: 0, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "profile_url", limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "customers", "users"
  add_foreign_key "reservations", "customers"
  add_foreign_key "reservations", "trainers"
  add_foreign_key "tokens", "users"
  add_foreign_key "trainers", "companies"
  add_foreign_key "trainers", "users"
end
