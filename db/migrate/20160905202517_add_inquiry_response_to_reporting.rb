class AddInquiryResponseToReporting < ActiveRecord::Migration
  def change
  	add_column :reports, :deg_resolved_count, :integer
  end
end
