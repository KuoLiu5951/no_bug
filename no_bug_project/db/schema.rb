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

ActiveRecord::Schema.define(version: 20190414093739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applies", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "project_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_published", default: false
    t.index ["project_id"], name: "index_applies_on_project_id"
    t.index ["student_id"], name: "index_applies_on_student_id"
    t.index ["teacher_id"], name: "index_applies_on_teacher_id"
  end

  create_table "graders", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "project_id"
    t.bigint "teacher_id"
    t.boolean "is_published", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_graders_on_project_id"
    t.index ["student_id"], name: "index_graders_on_student_id"
    t.index ["teacher_id"], name: "index_graders_on_teacher_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "day"
    t.time "start_on"
    t.time "finish_on"
    t.string "teacher_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "teacher_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.integer "sex"
    t.date "birth"
    t.string "free_day"
    t.time "start_free_time"
    t.time "expired_free_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "email"
  end

  create_table "teacher_and_students", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_teacher_and_students_on_student_id"
    t.index ["teacher_id"], name: "index_teacher_and_students_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.integer "sex"
    t.date "birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "email"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_teacher", default: false
    t.boolean "is_admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
