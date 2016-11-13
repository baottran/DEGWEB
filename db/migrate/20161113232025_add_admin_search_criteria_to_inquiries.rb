class AddAdminSearchCriteriaToInquiries < ActiveRecord::Migration
  def change
  	add_column :inquiries, :admin_search_criteria, :text
  end
end
