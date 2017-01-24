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

ActiveRecord::Schema.define(version: 20170109211907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.boolean  "joinable",   default: true
    t.integer  "creator_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "game_name"
    t.string   "game_key"
  end

  create_table "missions", force: :cascade do |t|
    t.integer  "mission_number"
    t.integer  "member_count"
    t.boolean  "double_fail"
    t.boolean  "resolved"
    t.boolean  "success"
    t.integer  "game_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "turn_order"
    t.boolean  "is_spy",     default: false
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.boolean  "is_a_go",    default: false
    t.boolean  "resolved",   default: false
    t.integer  "leader_id"
    t.integer  "mission_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "team_mbrs", force: :cascade do |t|
    t.integer  "member_id"
    t.string   "team_mbrable_type"
    t.integer  "team_mbrable_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["team_mbrable_type", "team_mbrable_id"], name: "index_team_mbrs_on_team_mbrable_type_and_team_mbrable_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.boolean  "up_vote"
    t.integer  "voter_id"
    t.string   "voteable_type"
    t.integer  "voteable_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["voteable_type", "voteable_id"], name: "index_votes_on_voteable_type_and_voteable_id", using: :btree
  end

end
