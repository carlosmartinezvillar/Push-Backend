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

ActiveRecord::Schema.define(version: 20170213220839) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consumer_events", force: :cascade do |t|
    t.integer  "consumer_id",     null: false
    t.integer  "event_type_id",   null: false
    t.integer  "article_id"
    t.integer  "notification_id"
    t.string   "language"
    t.string   "search_phrase"
    t.integer  "length"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "consumer_events", ["article_id"], name: "index_consumer_events_on_article_id", using: :btree
  add_index "consumer_events", ["consumer_id"], name: "index_consumer_events_on_consumer_id", using: :btree
  add_index "consumer_events", ["event_type_id"], name: "index_consumer_events_on_event_type_id", using: :btree
  add_index "consumer_events", ["notification_id"], name: "index_consumer_events_on_notification_id", using: :btree

  create_table "consumers", force: :cascade do |t|
    t.string   "uuid",                   null: false
    t.datetime "last_seen",              null: false
    t.integer  "times_seen", default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "consumers", ["uuid"], name: "index_consumers_on_uuid", unique: true, using: :btree

  create_table "notifications", force: :cascade do |t|
    t.text     "message"
    t.string   "language"
    t.integer  "reach"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "push_time"
    t.string   "article_id"
  end

  create_table "push_devices", force: :cascade do |t|
    t.string   "dev_token"
    t.string   "dev_id"
    t.string   "language"
    t.string   "platform"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status",     default: 0, null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string   "var",                   null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                                 default: "", null: false
    t.string   "encrypted_password",                    default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.integer  "{:index=>true, :foreign_key=>true}_id"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
