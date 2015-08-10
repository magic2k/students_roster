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

ActiveRecord::Schema.define(version: 20150809110756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "disciplines", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "discipline_id"
    t.integer  "grade"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "grades", ["discipline_id"], name: "index_grades_on_discipline_id", using: :btree
  add_index "grades", ["student_id", "discipline_id"], name: "index_grades_on_student_id_and_discipline_id", unique: true, using: :btree
  add_index "grades", ["student_id"], name: "index_grades_on_student_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groups", ["name"], name: "index_groups_on_name", unique: true, using: :btree

  create_table "lead_characteristic_of_students", force: :cascade do |t|
    t.text     "characteristic"
    t.integer  "student_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "lead_characteristic_of_students", ["student_id"], name: "index_lead_characteristic_of_students_on_student_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.string   "email"
    t.inet     "ip_address"
    t.integer  "semester"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "group_id"
  end

  add_index "students", ["email"], name: "index_students_on_email", using: :btree
  add_index "students", ["group_id"], name: "index_students_on_group_id", using: :btree
  add_index "students", ["ip_address"], name: "index_students_on_ip_address", using: :btree
  add_index "students", ["semester"], name: "index_students_on_semester", using: :btree

  add_foreign_key "lead_characteristic_of_students", "students"
  add_foreign_key "students", "groups"
end
