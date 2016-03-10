class AddStateToInquiry < ActiveRecord::Migration
  def change
  	add_column :inquiries, :state, :string
  end
end
