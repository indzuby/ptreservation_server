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

ActiveRecord::Schema.define(version: 20160412093211) do

  create_table "companies", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "tel",        null: false
    t.string   "address",    null: false
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tranier_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.datetime "start_datetime"
    t.datetime "end_datetime"
  end

  add_index "reservations", ["tranier_id"], name: "index_reservations_on_tranier_id"
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id"

  create_table "test_models", force: :cascade do |t|
    t.string   "name"
    t.integer  "sex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainers", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "password",   null: false
    t.string   "tel",        null: false
    t.integer  "sex"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "trainers", ["company_id"], name: "index_trainers_on_company_id"
  add_index "trainers", ["email"], name: "index_trainers_on_email", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "password",   null: false
    t.string   "tel",        null: false
    t.integer  "sex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
