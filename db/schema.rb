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

ActiveRecord::Schema.define(version: 2018_07_06_074147) do

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memos", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "user_id"
    t.datetime "made_time"
    t.datetime "updated_time"
    t.index ["user_id"], name: "index_memos_on_user_id"
  end

  create_table "notices", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "has_read", default: false, null: false
    t.string "message"
    t.integer "user_id"
    t.datetime "created_at"
    t.index ["user_id"], name: "index_notices_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
