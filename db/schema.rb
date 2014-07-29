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

ActiveRecord::Schema.define(version: 20140729124742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.integer  "order",                    null: false
    t.string   "title",                    null: false
    t.text     "content"
    t.datetime "public_at"
    t.datetime "last_edit_at"
    t.integer  "new_edit",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "book_id"
  end

  create_table "books", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "shortname"
  end

  create_table "comments", force: true do |t|
    t.integer  "commenter_id"
    t.text     "content"
    t.datetime "create_at"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["question_id"], name: "index_comments_on_question_id", using: :btree

  create_table "questions", force: true do |t|
    t.string   "title",                           null: false
    t.text     "content"
    t.text     "official_answer"
    t.datetime "create_at"
    t.boolean  "if_finished",     default: false
    t.integer  "author_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["article_id"], name: "index_questions_on_article_id", using: :btree

end
