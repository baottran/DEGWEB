class AddOldDescriptionToInquiries < ActiveRecord::Migration
  def change
  	add_column :inquiries, :old_description, :string
  end
end
