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

ActiveRecord::Schema.define(version: 20171210201339) do

  create_table "accounts", force: :cascade do |t|
    t.string   "vorname"
    t.string   "nachname"
    t.string   "geschlecht"
    t.boolean  "istMitarbeiter"
    t.integer  "fahrerbewertung"
    t.integer  "mitfahrerbewertung"
    t.string   "standort"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "fahrts", force: :cascade do |t|
    t.string   "von"
    t.string   "nach"
    t.integer  "dauer"
    t.integer  "preisProMitfahrer"
    t.integer  "maxMitfahrer"
    t.integer  "account_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "fahrts", ["account_id"], name: "index_fahrts_on_account_id"

  create_table "mitfahrers", force: :cascade do |t|
    t.integer  "fahrt_id"
    t.integer  "account_id"
    t.integer  "mitfahrerbewertung"
    t.integer  "fahrerbewertung"
    t.boolean  "istBestatigt"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "mitfahrers", ["account_id"], name: "index_mitfahrers_on_account_id"
  add_index "mitfahrers", ["fahrt_id"], name: "index_mitfahrers_on_fahrt_id"

end
