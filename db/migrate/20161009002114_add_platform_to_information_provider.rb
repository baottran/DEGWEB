class AddPlatformToInformationProvider < ActiveRecord::Migration
  def change
  	add_column :information_providers, :platform, :string
  end
end
