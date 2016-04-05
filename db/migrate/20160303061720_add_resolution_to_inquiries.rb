class AddResolutionToInquiries < ActiveRecord::Migration
  def change
  	add_column :inquiries, :resolution, :string
  end
end
