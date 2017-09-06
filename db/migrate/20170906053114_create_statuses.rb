class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :type
      t.text :text
      t.boolean :activated
      t.boolean :can_create_inquiries

      t.timestamps null: false
    end
  end
end
