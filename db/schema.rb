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

ActiveRecord::Schema.define(version: 20160223142009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "problems", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "replies", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "solution_id"
  end

  add_index "replies", ["solution_id"], name: "index_replies_on_solution_id", using: :btree

  create_table "solutions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "problem_id"
  end

  add_index "solutions", ["problem_id"], name: "index_solutions_on_problem_id", using: :btree

  create_table "upvotes", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "solution_id"
    t.integer  "problem_id"
  end

  add_index "upvotes", ["problem_id"], name: "index_upvotes_on_problem_id", using: :btree
  add_index "upvotes", ["solution_id"], name: "index_upvotes_on_solution_id", using: :btree

  add_foreign_key "replies", "solutions"
  add_foreign_key "solutions", "problems"
  add_foreign_key "upvotes", "problems"
  add_foreign_key "upvotes", "solutions"
end
