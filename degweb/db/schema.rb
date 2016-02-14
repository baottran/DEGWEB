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

ActiveRecord::Schema.define(version: 20160214004332) do

  create_table "comments", force: :cascade do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "inquiry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["inquiry_id"], name: "index_comments_on_inquiry_id"

  create_table "inquiries", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.string   "shop_name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "zip_code"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.string   "make"
    t.string   "model"
    t.string   "year"
    t.string   "body_type"
    t.string   "vin"
    t.string   "database"
    t.string   "client_id"
    t.string   "inquiry_type"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "state"
    t.string   "area_of_vechicle"
    t.string   "part_name"
    t.string   "part_description"
    t.string   "oem_part_number"
    t.string   "missing_information"
    t.string   "issue_summary"
    t.string   "suggested_action"
    t.string   "page_number"
    t.string   "part_number"
    t.string   "weld_spots"
    t.string   "materials_involved"
    t.string   "procedure_steps"
    t.string   "skill_level"
    t.string   "complete_time_hour"
    t.string   "complete_time_min"
    t.string   "special_labor"
    t.string   "surface_area"
    t.string   "make_other_field"
    t.string   "area_of_vechicle_other_field"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
