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

ActiveRecord::Schema.define(version: 20160303063430) do

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
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "state"
    t.string   "make_other_field"
    t.string   "missing_area_of_vechicle"
    t.string   "missing_area_of_vechicle_other_field"
    t.string   "missing_part_name"
    t.string   "missing_part_description"
    t.string   "missing_oem_part_number"
    t.string   "missing_information"
    t.string   "missing_issue_summary"
    t.string   "missing_suggested_action"
    t.string   "parts_area_of_vechicle"
    t.string   "parts_area_of_vechicle_other_field"
    t.string   "parts_part_name"
    t.string   "parts_part_description"
    t.string   "parts_oem_part_number"
    t.string   "parts_issue_summary"
    t.string   "parts_suggested_action"
    t.string   "procedure_area_of_vechicle"
    t.string   "procedure_area_of_vechicle_other_field"
    t.string   "procedure_page_number"
    t.string   "procedure_issue_summary"
    t.string   "procedure_suggested_action"
    t.string   "welded_area_of_vechicle"
    t.string   "welded_area_of_vechicle_other_field"
    t.string   "welded_part_name"
    t.string   "welded_part_number"
    t.string   "welded_issue_summary"
    t.string   "welded_weld_spots"
    t.string   "welded_materials_involved"
    t.string   "welded_procedure_steps"
    t.string   "welded_skill_level"
    t.string   "welded_complete_time_hour"
    t.string   "welded_complete_time_min"
    t.string   "welded_suggested_action"
    t.string   "non_welded_area_of_vechicle"
    t.string   "non_welded_area_of_vechicle_other_field"
    t.string   "non_welded_part_name"
    t.string   "non_welded_part_number"
    t.string   "non_welded_issue_summary"
    t.string   "non_welded_procedure_steps"
    t.string   "non_welded_skill_level"
    t.string   "non_welded_complete_time_hour"
    t.string   "non_welded_complete_time_min"
    t.string   "non_welded_suggested_action"
    t.string   "refinished_area_of_vechicle"
    t.string   "refinished_area_of_vechicle_other_field"
    t.string   "refinished_issue_summary"
    t.string   "refinished_special_labor"
    t.string   "refinished_surface_area"
    t.string   "refinished_suggested_action"
    t.string   "all_other_issue_summary"
    t.string   "all_other_procedure_steps"
    t.string   "all_other_complete_time_hour"
    t.string   "all_other_complete_time_min"
    t.string   "all_other_suggested_action"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.string   "resolution"
    t.string   "status"
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
