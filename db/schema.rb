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

ActiveRecord::Schema.define(version: 2018_06_27_055247) do

  create_table "announcements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.date "event_date", null: false
    t.integer "max_num_team", null: false
    t.integer "min_num_team", null: false
    t.integer "max_num_people", null: false
    t.integer "min_num_people", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
  end

  create_table "team_lists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_lists_on_team_id"
    t.index ["user_id"], name: "index_team_lists_on_user_id"
  end

  create_table "teams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "student_id", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest", null: false
    t.boolean "admin", default: false, null: false
    t.string "name", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["student_id"], name: "index_users_on_student_id", unique: true
  end

  add_foreign_key "team_lists", "teams"
  add_foreign_key "team_lists", "users"
end
