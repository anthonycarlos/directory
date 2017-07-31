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

ActiveRecord::Schema.define(version: 20170731044014) do

  create_table "students", force: :cascade do |t|
    t.string "student_first"
    t.string "student_last"
    t.string "teacher"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "mother_first"
    t.string "mother_last"
    t.string "mother_email"
    t.string "mother_phone_number"
    t.string "mother_phone_type"
    t.string "father_first"
    t.string "father_last"
    t.string "father_email"
    t.string "father_phone_number"
    t.string "father_phone_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "grade"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "title"
    t.string "last"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "grade"
  end

end