# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_05_23_054047) do
  create_table "announcements", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "expires_at"
    t.boolean "featured", default: false
    t.string "image_url"
    t.string "link_label"
    t.string "link_url"
    t.integer "position", default: 0
    t.datetime "published_at"
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.index ["published_at"], name: "index_announcements_on_published_at"
  end

  create_table "events", force: :cascade do |t|
    t.string "address"
    t.boolean "all_day", default: false
    t.string "category", default: "general"
    t.datetime "created_at", null: false
    t.text "description"
    t.datetime "ends_at"
    t.boolean "featured", default: false
    t.string "image_url"
    t.string "location"
    t.boolean "recurring", default: false
    t.string "registration_url"
    t.datetime "starts_at", null: false
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.index ["starts_at"], name: "index_events_on_starts_at"
  end

  create_table "groups", force: :cascade do |t|
    t.integer "capacity"
    t.string "category", default: "small_group"
    t.datetime "created_at", null: false
    t.text "description"
    t.string "image_url"
    t.string "leader_email"
    t.string "leader_name"
    t.string "location"
    t.string "meeting_schedule"
    t.string "name", null: false
    t.boolean "open_enrollment", default: true
    t.datetime "updated_at", null: false
  end

  create_table "prayer_requests", force: :cascade do |t|
    t.boolean "anonymous", default: false
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.boolean "public_display", default: false
    t.text "request", null: false
    t.string "status", default: "new"
    t.datetime "updated_at", null: false
  end

  create_table "sermon_series", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.boolean "featured", default: false
    t.string "image_url"
    t.string "name", null: false
    t.integer "position", default: 0
    t.datetime "updated_at", null: false
    t.integer "year"
  end

  create_table "sermons", force: :cascade do |t|
    t.string "audio_url"
    t.datetime "created_at", null: false
    t.text "description"
    t.integer "duration_minutes"
    t.boolean "featured", default: false
    t.date "preached_on"
    t.string "scripture_reference"
    t.integer "sermon_series_id"
    t.string "speaker", default: "Pastor"
    t.string "thumbnail_url"
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.string "video_url"
    t.index ["preached_on"], name: "index_sermons_on_preached_on"
    t.index ["sermon_series_id"], name: "index_sermons_on_sermon_series_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "sermons", "sermon_series"
  add_foreign_key "sessions", "users"
end
