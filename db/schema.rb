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

ActiveRecord::Schema.define(version: 20160520034603) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: :cascade do |t|
    t.string  "name",            limit: 100
    t.integer "ibu",             limit: 2
    t.float   "abv"
    t.boolean "limited_release"
    t.text    "description"
    t.integer "brewery_id"
  end

  create_table "breweries", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "address"
    t.float    "lat"
    t.float    "lon"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "establishments", force: :cascade do |t|
    t.string "name",        limit: 100
    t.float  "lat"
    t.float  "lon"
    t.string "address",     limit: 100
    t.text   "description"
  end

  create_table "futuredata", force: :cascade do |t|
    t.float    "lat"
    t.float    "lon"
    t.string   "device_guid", limit: 255
    t.integer  "beer_id"
    t.integer  "age",         limit: 2
    t.integer  "like_type",   limit: 2
    t.datetime "created_at",              default: '2016-05-20 11:25:05', null: false
    t.datetime "updated_at",              default: '2016-05-20 11:25:05', null: false
  end

  create_table "likes", force: :cascade do |t|
    t.string   "device_guid", limit: 255
    t.integer  "beer_id"
    t.integer  "like_type",   limit: 2
    t.datetime "created_at",              default: '2016-05-20 11:25:05', null: false
    t.datetime "updated_at",              default: '2016-05-20 11:25:05', null: false
    t.boolean  "state",                   default: false,                 null: false
  end

  create_table "reportstate", id: false, force: :cascade do |t|
    t.string   "device_guid",        limit: 255
    t.integer  "establishment_id"
    t.integer  "beer_id"
    t.integer  "report_count"
    t.datetime "last_report_update"
  end

  create_table "statuses", force: :cascade do |t|
    t.integer  "establishment_id"
    t.integer  "beer_id"
    t.integer  "status",             limit: 2
    t.integer  "report_countdown"
    t.integer  "reported_out_count"
    t.datetime "last_out_update"
  end

  create_table "usertoken", id: false, force: :cascade do |t|
    t.string "username", limit: 255
    t.string "email",    limit: 255
    t.string "token",    limit: 255
  end

end
