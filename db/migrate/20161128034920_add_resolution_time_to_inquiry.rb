class AddResolutionTimeToInquiry < ActiveRecord::Migration
  def change
  	add_column :inquiries, :completion_days, :int
  end
end
