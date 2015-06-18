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

ActiveRecord::Schema.define(version: 20150618173746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "grade_levels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grade_years", force: :cascade do |t|
    t.integer "year",       null: false
    t.float   "gpa",        null: false
    t.integer "student_id", null: false
    t.integer "grade_id",   null: false
  end

  add_index "grade_years", ["grade_id"], name: "index_grade_years_on_grade_id", using: :btree
  add_index "grade_years", ["student_id"], name: "index_grade_years_on_student_id", using: :btree

  create_table "grades", force: :cascade do |t|
    t.string   "letter"
    t.decimal  "number_value"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "grade_level_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "students", ["grade_level_id"], name: "index_students_on_grade_level_id", using: :btree

  add_foreign_key "grade_years", "grades"
  add_foreign_key "grade_years", "students"
  add_foreign_key "students", "grade_levels"
end
