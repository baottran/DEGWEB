class AddShowOnWebToInquiries < ActiveRecord::Migration
  def change
  	add_column :inquiries, :show_on_web, :bool
  end
end
