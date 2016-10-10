class AddInternalFlagToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :internal_only, :bool
  end
end
