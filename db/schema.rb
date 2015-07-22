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

ActiveRecord::Schema.define(version: 20150722014102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adventures", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "title"
    t.boolean  "include_final"
  end

  create_table "answers", force: :cascade do |t|
    t.text     "content"
    t.boolean  "correct"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "challenges", force: :cascade do |t|
    t.integer  "adventure_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
  end

  add_index "challenges", ["adventure_id"], name: "index_challenges_on_adventure_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.text     "content"
    t.string   "answer"
    t.integer  "challenge_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "questions", ["challenge_id"], name: "index_questions_on_challenge_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.integer  "adventure_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "reviews", ["adventure_id"], name: "index_reviews_on_adventure_id", using: :btree

  create_table "riddles", force: :cascade do |t|
    t.text     "content"
    t.string   "solution"
    t.string   "hint"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "challenge_id"
  end

  add_index "riddles", ["challenge_id"], name: "index_riddles_on_challenge_id", using: :btree

  add_foreign_key "answers", "questions"
  add_foreign_key "challenges", "adventures"
  add_foreign_key "questions", "challenges"
  add_foreign_key "reviews", "adventures"
  add_foreign_key "riddles", "challenges"
end
