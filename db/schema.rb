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

ActiveRecord::Schema.define(version: 20150831125051) do

  create_table "journeys", force: :cascade do |t|
    t.integer  "routeid"
    t.string   "date"
    t.integer  "booked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passengers", force: :cascade do |t|
    t.integer  "ticket_id"
    t.string   "name"
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.integer  "sid"
    t.integer  "did"
    t.string   "st"
    t.string   "et"
    t.integer  "fare"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "max"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "journey_id"
    t.integer  "user_id"
    t.integer  "route_id"
    t.string   "DOB"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "count"
    t.integer  "passenger_id"
    t.integer  "fare"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
