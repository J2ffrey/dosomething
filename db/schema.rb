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

ActiveRecord::Schema.define(version: 20151102190119) do

  create_table "admins", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "value",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "authorities", force: :cascade do |t|
    t.integer  "authority_bundle_id", limit: 4
    t.integer  "authority_def_id",    limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "authority_bundles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "text",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "authority_defs", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "value",      limit: 255
    t.string   "text",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "bongsa_tmps", force: :cascade do |t|
    t.string   "img_main",           limit: 255
    t.string   "img_poster",         limit: 255
    t.string   "name",               limit: 255
    t.text     "content",            limit: 65535
    t.boolean  "is_edu",             limit: 1
    t.integer  "status",             limit: 4
    t.integer  "organization_id",    limit: 4
    t.string   "clerk_name",         limit: 255
    t.string   "clerk_call",         limit: 255
    t.boolean  "is_regular",         limit: 1
    t.date     "date_recruit_start"
    t.date     "date_recruit_end"
    t.date     "date_real_start"
    t.date     "date_real_end"
    t.string   "time_daily_start",   limit: 255
    t.string   "time_daily_end",     limit: 255
    t.integer  "time_expect_total",  limit: 4
    t.integer  "vltr_num",           limit: 4
    t.integer  "vltr_age_id",        limit: 4
    t.integer  "vltr_sex",           limit: 4
    t.text     "vltr_req",           limit: 65535
    t.integer  "region_id",          limit: 4
    t.integer  "school_id",          limit: 4
    t.integer  "btime_id",           limit: 4
    t.integer  "category_id",        limit: 4
    t.string   "admin_add",          limit: 255
    t.string   "admin_mod",          limit: 255
    t.integer  "act_time",           limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "bongsas", force: :cascade do |t|
    t.boolean  "is_approval",         limit: 1
    t.text     "address",             limit: 65535
    t.boolean  "date_recruit_always", limit: 1
    t.string   "img_main",            limit: 255
    t.string   "img_poster",          limit: 255
    t.string   "name",                limit: 255
    t.text     "content",             limit: 65535
    t.boolean  "is_edu",              limit: 1
    t.integer  "status",              limit: 4
    t.integer  "organization_id",     limit: 4
    t.string   "clerk_name",          limit: 255
    t.string   "clerk_call",          limit: 255
    t.string   "clerk_email",         limit: 255
    t.boolean  "is_regular",          limit: 1
    t.date     "date_recruit_start"
    t.date     "date_recruit_end"
    t.date     "date_real_start"
    t.date     "date_real_end"
    t.string   "time_daily_start",    limit: 255
    t.string   "time_daily_end",      limit: 255
    t.integer  "time_expect_total",   limit: 4
    t.integer  "vltr_num",            limit: 4
    t.integer  "vltr_age_id",         limit: 4
    t.integer  "vltr_sex",            limit: 4
    t.text     "vltr_req",            limit: 65535
    t.integer  "region_id",           limit: 4
    t.integer  "school_id",           limit: 4
    t.integer  "btime_id",            limit: 4
    t.integer  "category_id",         limit: 4
    t.string   "admin_add",           limit: 255
    t.string   "admin_mod",           limit: 255
    t.integer  "act_time",            limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "btimes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "min",        limit: 4
    t.integer  "max",        limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "buckets", force: :cascade do |t|
    t.string   "user_id",          limit: 255
    t.string   "target_bongsa_id", limit: 255
    t.integer  "act_time",         limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "phone",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "real_bongsas", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "content",    limit: 255
    t.string   "date_start", limit: 255
    t.string   "date_end",   limit: 255
    t.string   "time_total", limit: 255
    t.string   "location",   limit: 255
    t.string   "region",     limit: 255
    t.string   "img",        limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "region2s", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "region_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tempcrawls", force: :cascade do |t|
    t.integer  "keytemp",    limit: 4
    t.string   "nametemp",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tempcrls", force: :cascade do |t|
    t.integer  "keytemp",      limit: 4
    t.string   "nametemp",     limit: 255
    t.integer  "is_registerd", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "tmpcrawls", force: :cascade do |t|
    t.integer  "keytmp",     limit: 4
    t.string   "nametmp",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tmpcrls", force: :cascade do |t|
    t.integer  "keytemp",    limit: 4
    t.string   "nametemp",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_types", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "text",                limit: 255
    t.integer  "authority_bundle_id", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "users", force: :cascade do |t|
    t.boolean  "available",           limit: 1,   default: false
    t.integer  "user_type_id",        limit: 4,   default: 0
    t.string   "name",                limit: 255, default: "",    null: false
    t.string   "picture",             limit: 255, default: ""
    t.string   "phonenumber",         limit: 255, default: "",    null: false
    t.integer  "organization_id",     limit: 4,   default: 0
    t.integer  "authority_bundle_id", limit: 4,   default: 1,     null: false
    t.string   "email",               limit: 255, default: "",    null: false
    t.string   "password",            limit: 255, default: "",    null: false
    t.integer  "sign_in_count",       limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",  limit: 255
    t.string   "last_sign_in_ip",     limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "view_counts", force: :cascade do |t|
    t.string   "ip_adress",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "vltr_ages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "min",        limit: 4
    t.integer  "max",        limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
