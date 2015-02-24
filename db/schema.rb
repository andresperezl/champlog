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

ActiveRecord::Schema.define(version: 20150224223200) do

  create_table "bug_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bugs", force: :cascade do |t|
    t.string   "type"
    t.string   "status"
    t.string   "patch"
    t.integer  "submitter_id"
    t.integer  "auditor_id"
    t.date     "solved_on"
    t.string   "short_description"
    t.string   "long_description"
    t.string   "expected_result"
    t.string   "experienced_result"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "champions", force: :cascade do |t|
    t.string   "riot_id"
    t.integer  "riot_key"
    t.string   "name"
    t.string   "title"
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
