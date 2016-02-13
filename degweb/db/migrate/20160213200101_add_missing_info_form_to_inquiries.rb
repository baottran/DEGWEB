class AddMissingInfoFormToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :area_of_vechicle, :string
    add_column :inquiries, :part_name, :string
    add_column :inquiries, :part_description, :string
    add_column :inquiries, :oem_part_number, :string
    add_column :inquiries, :missing_information, :string
    add_column :inquiries, :issue_summary, :string
    add_column :inquiries, :suggested_action, :string
  end
end
