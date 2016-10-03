class AddEmailkeyToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :emailkey, :string
  end
end
