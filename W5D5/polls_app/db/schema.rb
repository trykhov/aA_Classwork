# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_18_004330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_choices", force: :cascade do |t|
    t.integer "question_id"
    t.integer "user_id"
    t.text "text"
  end

  create_table "polls", force: :cascade do |t|
    t.string "title"
    t.integer "author_id"
    t.index ["author_id"], name: "index_polls_on_author_id", unique: true
  end

  create_table "questions", force: :cascade do |t|
    t.integer "poll_id"
    t.string "text"
  end

  create_table "responses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "question_id"
    t.integer "answer_choice_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
