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

ActiveRecord::Schema.define(version: 20180106162718) do

  create_table "accounts", force: :cascade do |t|
    t.string   "vorname"
    t.string   "nachname"
    t.string   "geschlecht"
    t.boolean  "istMitarbeiter"
    t.integer  "fahrerbewertung"
    t.integer  "mitfahrerbewertung"
    t.string   "standort"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "is_active",              default: true
  end

  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true
  add_index "accounts", ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true

  create_table "fahrts", force: :cascade do |t|
    t.string   "von"
    t.string   "nach"
    t.integer  "dauer"
    t.integer  "preisProMitfahrer"
    t.integer  "maxMitfahrer"
    t.integer  "account_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.boolean  "istGespeichert"
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

  create_table "nachrichts", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "empfaenger_id"
    t.string   "nachricht"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.datetime "seen"
    t.datetime "read"
  end

  add_index "nachrichts", ["empfaenger_id"], name: "index_nachrichts_on_empfaenger_id"
  add_index "nachrichts", ["sender_id"], name: "index_nachrichts_on_sender_id"

end
