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

ActiveRecord::Schema.define(version: 20141009024020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crimes", force: true do |t|
    t.integer  "neighborhood_id"
    t.integer  "rank"
    t.float    "per_capita"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "crimes", ["neighborhood_id"], name: "index_crimes_on_neighborhood_id", using: :btree

  create_table "neighborhoods", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "polygon"
    t.string   "center_lat"
    t.string   "center_lng"
  end

  create_table "profiles", force: true do |t|
    t.integer  "neighborhood_id"
    t.text     "raw_xml"
    t.string   "heading"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["neighborhood_id"], name: "index_profiles_on_neighborhood_id", using: :btree

end
