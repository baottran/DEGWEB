class AddAdditionalFormFieldsToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :page_number, :string
    add_column :inquiries, :part_number, :string
    add_column :inquiries, :weld_spots, :string
    add_column :inquiries, :materials_involved, :string
    add_column :inquiries, :procedure_steps, :string
    add_column :inquiries, :skill_level, :string
    add_column :inquiries, :complete_time_hour, :string
    add_column :inquiries, :complete_time_min, :string
    add_column :inquiries, :special_labor, :string
    add_column :inquiries, :surface_area, :string
  end
end
