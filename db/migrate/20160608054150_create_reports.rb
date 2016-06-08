class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
    	# counts
      t.integer :all_count
      t.integer :received_count
      t.integer :submitted_count
      t.integer :responded_count
      t.integer :ip_change_count
      t.integer :no_change_count

      #response and completion time
      t.decimal :avg_response_ccc
      t.decimal :avg_response_audatex
      t.decimal :avg_response_mitchell

      t.decimal :avg_completion_ccc
      t.decimal :avg_completion_mitchell
      t.decimal :avg_completion_audatex

      t.timestamps null: false
    end
  end
end
