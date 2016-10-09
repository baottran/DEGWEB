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

ActiveRecord::Schema.define(version: 20161009002114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "inquiry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["inquiry_id"], name: "index_comments_on_inquiry_id", using: :btree

  create_table "information_providers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "platform"
  end

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
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "state"
    t.string   "make_other_field"
    t.string   "missing_area_of_vehicle"
    t.string   "missing_area_of_vehicle_other_field"
    t.string   "missing_part_name"
    t.string   "missing_part_description"
    t.string   "missing_oem_part_number"
    t.string   "missing_information"
    t.string   "missing_issue_summary"
    t.string   "missing_suggested_action"
    t.string   "parts_area_of_vehicle"
    t.string   "parts_area_of_vehicle_other_field"
    t.string   "parts_part_name"
    t.string   "parts_part_description"
    t.string   "parts_oem_part_number"
    t.string   "parts_issue_summary"
    t.string   "parts_suggested_action"
    t.string   "procedure_area_of_vehicle"
    t.string   "procedure_area_of_vehicle_other_field"
    t.string   "procedure_page_number"
    t.string   "procedure_issue_summary"
    t.string   "procedure_suggested_action"
    t.string   "welded_area_of_vehicle"
    t.string   "welded_area_of_vehicle_other_field"
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
    t.string   "non_welded_area_of_vehicle"
    t.string   "non_welded_area_of_vehicle_other_field"
    t.string   "non_welded_part_name"
    t.string   "non_welded_part_number"
    t.string   "non_welded_issue_summary"
    t.string   "non_welded_procedure_steps"
    t.string   "non_welded_skill_level"
    t.string   "non_welded_complete_time_hour"
    t.string   "non_welded_complete_time_min"
    t.string   "non_welded_suggested_action"
    t.string   "refinished_area_of_vehicle"
    t.string   "refinished_area_of_vehicle_other_field"
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
    t.string   "search_criteria"
    t.datetime "submit_to_ip_date"
    t.datetime "ip_response_received_date"
    t.datetime "resolution_date"
    t.string   "area_of_vehicle"
    t.string   "attachment2_file_name"
    t.string   "attachment2_content_type"
    t.integer  "attachment2_file_size"
    t.datetime "attachment2_updated_at"
    t.string   "attachment3_file_name"
    t.string   "attachment3_content_type"
    t.integer  "attachment3_file_size"
    t.datetime "attachment3_updated_at"
    t.string   "attachment4_file_name"
    t.string   "attachment4_content_type"
    t.integer  "attachment4_file_size"
    t.datetime "attachment4_updated_at"
    t.string   "attachment5_file_name"
    t.string   "attachment5_content_type"
    t.integer  "attachment5_file_size"
    t.datetime "attachment5_updated_at"
    t.boolean  "show_on_web"
  end

  add_index "inquiries", ["created_at"], name: "index_inquiries_on_created_at", using: :btree
  add_index "inquiries", ["id"], name: "index_inquiries_on_id", using: :btree
  add_index "inquiries", ["resolution_date"], name: "index_inquiries_on_resolution_date", using: :btree
  add_index "inquiries", ["status"], name: "index_inquiries_on_status", using: :btree
  add_index "inquiries", ["submit_to_ip_date"], name: "index_inquiries_on_submit_to_ip_date", using: :btree
  add_index "inquiries", ["year"], name: "index_inquiries_on_year", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "all_count"
    t.integer  "received_count"
    t.integer  "submitted_count"
    t.integer  "responded_count"
    t.integer  "ip_change_count"
    t.integer  "no_change_count"
    t.decimal  "avg_response_ccc"
    t.decimal  "avg_response_audatex"
    t.decimal  "avg_response_mitchell"
    t.decimal  "avg_completion_ccc"
    t.decimal  "avg_completion_mitchell"
    t.decimal  "avg_completion_audatex"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "num_submitted_all_ccc"
    t.integer  "num_submitted_week_ccc"
    t.integer  "num_submitted_month_ccc"
    t.integer  "num_submitted_quarter_ccc"
    t.integer  "num_submitted_year_ccc"
    t.integer  "num_submitted_all_mitchell"
    t.integer  "num_submitted_week_mitchell"
    t.integer  "num_submitted_month_mitchell"
    t.integer  "num_submitted_quarter_mitchell"
    t.integer  "num_submitted_year_mitchell"
    t.integer  "num_submitted_all_audatex"
    t.integer  "num_submitted_week_audatex"
    t.integer  "num_submitted_month_audatex"
    t.integer  "num_submitted_quarter_audatex"
    t.integer  "num_submitted_year_audatex"
    t.integer  "num_unsubmitted_all_ccc"
    t.integer  "num_unsubmitted_week_ccc"
    t.integer  "num_unsubmitted_month_ccc"
    t.integer  "num_unsubmitted_quarter_ccc"
    t.integer  "num_unsubmitted_year_ccc"
    t.integer  "num_unsubmitted_all_mitchell"
    t.integer  "num_unsubmitted_week_mitchell"
    t.integer  "num_unsubmitted_month_mitchell"
    t.integer  "num_unsubmitted_quarter_mitchell"
    t.integer  "num_unsubmitted_year_mitchell"
    t.integer  "num_unsubmitted_all_audatex"
    t.integer  "num_unsubmitted_week_audatex"
    t.integer  "num_unsubmitted_month_audatex"
    t.integer  "num_unsubmitted_quarter_audatex"
    t.integer  "num_unsubmitted_year_audatex"
    t.integer  "deg_resolved_count"
  end

  create_table "searches", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "isadmin"
    t.string   "emailkey"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "comments", "inquiries"
end
