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

ActiveRecord::Schema.define(version: 20160404182708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.string   "title",        null: false
    t.string   "description"
    t.string   "comments"
    t.integer  "grade"
    t.date     "due_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "student_id"
    t.integer  "classroom_id"
    t.integer  "user_id"
  end

  add_index "assignments", ["classroom_id"], name: "index_assignments_on_classroom_id", using: :btree
  add_index "assignments", ["student_id"], name: "index_assignments_on_student_id", using: :btree

  create_table "classrooms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "users_id"
  end

  create_table "students", force: :cascade do |t|
    t.string   "name",          null: false
    t.string   "comments"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "classroom_id"
    t.integer  "assignment_id"
  end

  add_index "students", ["assignment_id"], name: "index_students_on_assignment_id", using: :btree
  add_index "students", ["classroom_id"], name: "index_students_on_classroom_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "token",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name"
    t.string   "school"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["token"], name: "index_users_on_token", unique: true, using: :btree

  add_foreign_key "students", "assignments"
  add_foreign_key "students", "classrooms"
end
