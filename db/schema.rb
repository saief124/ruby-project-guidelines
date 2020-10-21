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

ActiveRecord::Schema.define(version: 2020_10_21_062850) do

  create_table "trainers", force: :cascade do |t|
    t.string "name"
    t.integer "yrs_exp"
    t.float "cost"
    t.string "about_me"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.float "weight"
    t.float "height"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "exercises_done"
    t.integer "trainer_id"
    t.integer "user_id"
  end

end
