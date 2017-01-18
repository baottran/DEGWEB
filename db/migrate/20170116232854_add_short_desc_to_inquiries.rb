class AddShortDescToInquiries < ActiveRecord::Migration
  def change
  	    add_column :inquiries, :short_desc      , :string
  end
end
