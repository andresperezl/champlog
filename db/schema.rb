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

ActiveRecord::Schema.define(version: 20150225205542) do

  create_table "bug_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bugs", force: :cascade do |t|
    t.string   "expected"
    t.string   "experienced"
    t.decimal  "rate",        precision: 3, scale: 2
    t.integer  "patch_id"
    t.string   "steps"
    t.integer  "user_id"
    t.integer  "tester_id"
    t.integer  "bug_type_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "bugs", ["bug_type_id"], name: "index_bugs_on_bug_type_id"
  add_index "bugs", ["patch_id"], name: "index_bugs_on_patch_id"
  add_index "bugs", ["tester_id"], name: "index_bugs_on_tester_id"
  add_index "bugs", ["user_id"], name: "index_bugs_on_user_id"

  create_table "champions", force: :cascade do |t|
    t.string   "riot_id"
    t.integer  "riot_key"
    t.string   "name"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maps", force: :cascade do |t|
    t.string   "name"
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patches", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "password_digest"
    t.string   "summoner_name"
    t.integer  "summoner_id"
    t.string   "region"
    t.boolean  "confirmed"
    t.string   "confirmation_key"
    t.boolean  "tester"
    t.boolean  "admin"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "remember_digest"
    t.integer  "summoner_icon"
    t.datetime "verify_timeout"
  end

end
