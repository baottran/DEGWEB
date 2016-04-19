class AddAreaOfVehicleToInquiries < ActiveRecord::Migration
  def change
  	add_column :inquiries, :area_of_vehicle, :string
  end
end
