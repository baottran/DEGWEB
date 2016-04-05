class AddSearchCriteriaToInquiries < ActiveRecord::Migration
  def change
  	add_column :inquiries, :search_criteria, :string
  end
end
