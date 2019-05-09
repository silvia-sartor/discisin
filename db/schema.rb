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

ActiveRecord::Schema.define(version: 2019_04_18_171223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "cat"
    t.boolean "show_teams?", default: false
    t.boolean "show_schedule?", default: false
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_categories_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.date "when"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.float "price"
    t.string "currency"
    t.text "description"
    t.string "links"
    t.string "contact"
    t.string "picture"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.boolean "notification?", default: true
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_favorites_on_event_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "day_time"
    t.string "name"
    t.string "category"
    t.integer "game_length"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "field"
    t.boolean "game_points", default: true
    t.integer "hometeam_score"
    t.integer "awayteam_score"
    t.bigint "hometeam_id"
    t.bigint "awayteam_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["awayteam_id"], name: "index_matches_on_awayteam_id"
    t.index ["category_id"], name: "index_matches_on_category_id"
    t.index ["hometeam_id"], name: "index_matches_on_hometeam_id"
  end

  create_table "members", force: :cascade do |t|
    t.boolean "accepted?", default: false
    t.bigint "team_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_members_on_team_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "points", force: :cascade do |t|
    t.integer "pt"
    t.integer "metefatte"
    t.integer "metesubite"
    t.integer "metedifference"
    t.bigint "team_id"
    t.bigint "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_points_on_match_id"
    t.index ["team_id"], name: "index_points_on_team_id"
  end

  create_table "sotgs", force: :cascade do |t|
    t.integer "sotg1"
    t.integer "sotg2"
    t.integer "sotg3"
    t.integer "sotg4"
    t.integer "sotg5"
    t.integer "total"
    t.text "comment"
    t.bigint "voting_team_id"
    t.bigint "voted_team_id"
    t.bigint "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_sotgs_on_match_id"
    t.index ["voted_team_id"], name: "index_sotgs_on_voted_team_id"
    t.index ["voting_team_id"], name: "index_sotgs_on_voting_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.integer "rating"
    t.boolean "accepted", default: false
    t.bigint "user_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_teams_on_category_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstname"
    t.string "lastname"
    t.string "nickname"
    t.date "birthday"
    t.string "phone"
    t.string "city"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categories", "events"
  add_foreign_key "events", "users"
  add_foreign_key "favorites", "events"
  add_foreign_key "favorites", "users"
  add_foreign_key "matches", "categories"
  add_foreign_key "matches", "teams", column: "awayteam_id"
  add_foreign_key "matches", "teams", column: "hometeam_id"
  add_foreign_key "members", "teams"
  add_foreign_key "members", "users"
  add_foreign_key "points", "matches"
  add_foreign_key "points", "teams"
  add_foreign_key "sotgs", "matches"
  add_foreign_key "sotgs", "teams", column: "voted_team_id"
  add_foreign_key "sotgs", "teams", column: "voting_team_id"
  add_foreign_key "teams", "categories"
  add_foreign_key "teams", "users"
end
