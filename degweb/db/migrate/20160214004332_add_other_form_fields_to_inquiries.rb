class AddOtherFormFieldsToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :make_other_field, :string
    add_column :inquiries, :area_of_vechicle_other_field, :string
  end
end
