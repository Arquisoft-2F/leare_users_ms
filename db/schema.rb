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

ActiveRecord::Schema[7.1].define(version: 2024_03_08_025327) do
  create_table "courses_users", primary_key: ["course_id", "user_id"], charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "course_id", null: false
    t.float "progress", default: 0.0, null: false
    t.float "score", default: 0.0, null: false
    t.date "listed_on", null: false
    t.date "last_seen", null: false
    t.string "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_courses_users_on_user_id"
  end

  create_table "users", id: { type: :string, limit: 36 }, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "name", null: false
    t.string "lastname", null: false
    t.string "picture_id"
    t.string "nationality"
    t.string "email", null: false
    t.string "web_site"
    t.text "biography"
    t.string "twitter_link"
    t.string "linkedin_link"
    t.string "facebook_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "courses_users", "users"
  add_foreign_key "courses_users", "users", name: "fk_user", on_update: :cascade
end
