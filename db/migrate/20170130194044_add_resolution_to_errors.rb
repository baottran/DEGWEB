class AddResolutionToErrors < ActiveRecord::Migration
  def change
  	add_column :errors, :resolution	, :string 
  end
end
