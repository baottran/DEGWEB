class AddOldIndicatorToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :transferred_from_old_db      , :bool
  end
end
