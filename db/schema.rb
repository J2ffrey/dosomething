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

ActiveRecord::Schema.define(version: 20150917190749) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bongsas", force: :cascade do |t|
    t.string   "img_main"
    t.string   "img_poster"
    t.string   "name"
    t.text     "content"
    t.boolean  "is_edu"
    t.integer  "status"
    t.integer  "organization_id"
    t.string   "clerk_name"
    t.string   "clerk_call"
    t.boolean  "is_regular"
    t.string   "date_recruit_start"
    t.string   "date_recruit_end"
    t.integer  "date_real_start"
    t.integer  "date_real_end"
    t.integer  "time_daily_start"
    t.integer  "time_daily_end"
    t.integer  "time_expect_total"
    t.integer  "vltr_num"
    t.integer  "vltr_age_id"
    t.integer  "vltr_sex"
    t.text     "vltr_req"
    t.integer  "region_id"
    t.integer  "school_id"
    t.integer  "btime_id"
    t.integer  "category_id"
    t.string   "admin_add"
    t.string   "admin_mod"
    t.integer  "act_time"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "btimes", force: :cascade do |t|
    t.string   "name"
    t.integer  "min"
    t.integer  "max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buckets", force: :cascade do |t|
    t.string   "user_id"
    t.string   "target_bongsa_id"
    t.integer  "act_time"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "real_bongsas", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.string   "date_start"
    t.string   "date_end"
    t.string   "time_total"
    t.string   "location"
    t.string   "region"
    t.string   "img"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "region2s", force: :cascade do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "view_counts", force: :cascade do |t|
    t.string   "ip_adress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vltr_ages", force: :cascade do |t|
    t.string   "name"
    t.integer  "min"
    t.integer  "max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
