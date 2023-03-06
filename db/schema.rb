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

ActiveRecord::Schema[7.0].define(version: 2023_03_05_204043) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.string "location"
    t.float "cost"
    t.string "title"
    t.bigint "plan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_activities_on_plan_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "participant_id", null: false
    t.bigint "plan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_messages_on_participant_id"
    t.index ["plan_id"], name: "index_messages_on_plan_id"
  end

  create_table "options", force: :cascade do |t|
    t.bigint "poll_id", null: false
    t.string "choice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poll_id"], name: "index_options_on_poll_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string "status", default: "Pending"
    t.bigint "user_id", null: false
    t.bigint "plan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_participants_on_plan_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "title"
    t.integer "planner_id"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.string "location"
    t.float "cost"
    t.text "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "polls", force: :cascade do |t|
    t.text "question"
    t.bigint "plan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_polls_on_plan_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nickname"
    t.string "avatar_picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "option_id", null: false
    t.bigint "participant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_votes_on_option_id"
    t.index ["participant_id"], name: "index_votes_on_participant_id"
  end

  add_foreign_key "activities", "plans"
  add_foreign_key "messages", "participants"
  add_foreign_key "messages", "plans"
  add_foreign_key "options", "polls"
  add_foreign_key "participants", "plans"
  add_foreign_key "participants", "users"
  add_foreign_key "polls", "plans"
  add_foreign_key "votes", "options"
  add_foreign_key "votes", "participants"
end
