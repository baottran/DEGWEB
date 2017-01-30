class AddIdentificationToError < ActiveRecord::Migration
  def change
  	add_column :errors, :error_field   	, :string 
  	add_column :errors, :error_value	, :string 
  end
end
