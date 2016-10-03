class AddAdminToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :isadmin, :bool
  end
end
