class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string :name
      t.string :title
      t.string :shop_name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :zip_code
      t.string :phone
      t.string :fax
      t.string :email
      t.string :make
      t.string :model
      t.string :year
      t.string :body_type
      t.string :vin
      t.string :database
      t.string :client_id
      t.string :inquiry_type

      t.timestamps null: false
    end
  end
end
