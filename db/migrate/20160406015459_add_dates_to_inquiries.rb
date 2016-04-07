class AddDatesToInquiries < ActiveRecord::Migration
  def change
  	add_column :inquiries, :submit_to_ip_date, :datetime
  	add_column :inquiries, :ip_response_received_date, :datetime
  	add_column :inquiries, :resolution_date, :datetime
  end
end
