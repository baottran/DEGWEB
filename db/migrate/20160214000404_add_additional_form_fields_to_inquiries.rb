class AddAdditionalFormFieldsToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :make_other_field, :string
    add_column :inquiries, :missing_area_of_vehicle, :string
    add_column :inquiries, :missing_area_of_vehicle_other_field, :string
    add_column :inquiries, :missing_part_name, :string
    add_column :inquiries, :missing_part_description, :string
    add_column :inquiries, :missing_oem_part_number, :string
    add_column :inquiries, :missing_information, :string
    add_column :inquiries, :missing_issue_summary, :string
    add_column :inquiries, :missing_suggested_action, :string
    add_column :inquiries, :parts_area_of_vehicle, :string
    add_column :inquiries, :parts_area_of_vehicle_other_field, :string
    add_column :inquiries, :parts_part_name, :string
    add_column :inquiries, :parts_part_description, :string
    add_column :inquiries, :parts_oem_part_number, :string
    add_column :inquiries, :parts_issue_summary, :string
    add_column :inquiries, :parts_suggested_action, :string
    add_column :inquiries, :procedure_area_of_vehicle, :string
    add_column :inquiries, :procedure_area_of_vehicle_other_field, :string
    add_column :inquiries, :procedure_page_number, :string
    add_column :inquiries, :procedure_issue_summary, :string
    add_column :inquiries, :procedure_suggested_action, :string
    add_column :inquiries, :welded_area_of_vehicle, :string
    add_column :inquiries, :welded_area_of_vehicle_other_field, :string
    add_column :inquiries, :welded_part_name, :string
    add_column :inquiries, :welded_part_number, :string
    add_column :inquiries, :welded_issue_summary, :string
    add_column :inquiries, :welded_weld_spots, :string
    add_column :inquiries, :welded_materials_involved, :string
    add_column :inquiries, :welded_procedure_steps, :string
    add_column :inquiries, :welded_skill_level, :string
    add_column :inquiries, :welded_complete_time_hour, :string
    add_column :inquiries, :welded_complete_time_min, :string
    add_column :inquiries, :welded_suggested_action, :string
    add_column :inquiries, :non_welded_area_of_vehicle, :string
    add_column :inquiries, :non_welded_area_of_vehicle_other_field, :string
    add_column :inquiries, :non_welded_part_name, :string
    add_column :inquiries, :non_welded_part_number, :string
    add_column :inquiries, :non_welded_issue_summary, :string
    add_column :inquiries, :non_welded_procedure_steps, :string
    add_column :inquiries, :non_welded_skill_level, :string
    add_column :inquiries, :non_welded_complete_time_hour, :string
    add_column :inquiries, :non_welded_complete_time_min, :string
    add_column :inquiries, :non_welded_suggested_action, :string
    add_column :inquiries, :refinished_area_of_vehicle, :string
    add_column :inquiries, :refinished_area_of_vehicle_other_field, :string
    add_column :inquiries, :refinished_issue_summary, :string
    add_column :inquiries, :refinished_special_labor, :string
    add_column :inquiries, :refinished_surface_area, :string
    add_column :inquiries, :refinished_suggested_action, :string
    add_column :inquiries, :all_other_issue_summary, :string
    add_column :inquiries, :all_other_procedure_steps, :string
    add_column :inquiries, :all_other_complete_time_hour, :string
    add_column :inquiries, :all_other_complete_time_min, :string
    add_column :inquiries, :all_other_suggested_action, :string
  end
end