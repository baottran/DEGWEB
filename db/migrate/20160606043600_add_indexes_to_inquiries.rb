class AddIndexesToInquiries < ActiveRecord::Migration
  def change
  	add_index :inquiries, :id 
  	add_index :inquiries, :created_at
  	add_index :inquiries, :status
  	add_index :inquiries, :year
  	add_index :inquiries, :submit_to_ip_date
  	add_index :inquiries, :resolution_date
  end
end
