class CreateErrorsTable < ActiveRecord::Migration
  def change
    create_table :errors do |t|
      t.string :inquiry_num
      t.string :error_msg 

      t.timestamps null: false
    end
  end
end
