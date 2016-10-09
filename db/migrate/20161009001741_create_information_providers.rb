class CreateInformationProviders < ActiveRecord::Migration
  def change
    create_table :information_providers do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
