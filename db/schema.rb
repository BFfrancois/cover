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

ActiveRecord::Schema.define(version: 20170723001702) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "job_id"
    t.bigint "user_id"
    t.index ["job_id"], name: "index_applications_on_job_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "job_id"
    t.bigint "user_id"
    t.index ["job_id"], name: "index_comments_on_job_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "jobtype_id"
    t.string "employer_name"
    t.integer "months"
    t.text "description"
    t.index ["jobtype_id"], name: "index_experiences_on_jobtype_id"
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "rate"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "jobtype_id"
    t.bigint "user_id"
    t.index ["jobtype_id"], name: "index_jobs_on_jobtype_id"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "jobtypes", force: :cascade do |t|
    t.string "name"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_by"
    t.bigint "user_about"
    t.bigint "rating"
    t.text "comment"
    t.bigint "user_id"
    t.index ["user_about"], name: "index_reviews_on_user_about"
    t.index ["user_by"], name: "index_reviews_on_user_by"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.bigint "cell"
    t.string "first_name"
    t.string "last_name"
    t.string "restaurant_name"
    t.string "street_address"
    t.string "city"
    t.string "province"
    t.string "postal_code"
    t.text "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "usertype_id"
    t.float "longitude"
    t.float "latitude"
    t.index ["usertype_id"], name: "index_users_on_usertype_id"
  end

  create_table "usertypes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  add_foreign_key "applications", "jobs"
  add_foreign_key "applications", "users"
  add_foreign_key "comments", "jobs"
  add_foreign_key "comments", "users"
  add_foreign_key "jobs", "jobtypes"
  add_foreign_key "jobs", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "users", "usertypes"
end
