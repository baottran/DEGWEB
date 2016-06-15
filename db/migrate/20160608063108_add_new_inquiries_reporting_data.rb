class AddNewInquiriesReportingData < ActiveRecord::Migration
  def change
  	add_column :reports, :num_submitted_all_ccc, :integer
  	add_column :reports, :num_submitted_week_ccc, :integer
  	add_column :reports, :num_submitted_month_ccc, :integer
  	add_column :reports, :num_submitted_quarter_ccc, :integer
  	add_column :reports, :num_submitted_year_ccc, :integer

  	add_column :reports, :num_submitted_all_mitchell, :integer
  	add_column :reports, :num_submitted_week_mitchell, :integer
  	add_column :reports, :num_submitted_month_mitchell, :integer
  	add_column :reports, :num_submitted_quarter_mitchell, :integer
  	add_column :reports, :num_submitted_year_mitchell, :integer

  	add_column :reports, :num_submitted_all_audatex, :integer
  	add_column :reports, :num_submitted_week_audatex, :integer
  	add_column :reports, :num_submitted_month_audatex, :integer
  	add_column :reports, :num_submitted_quarter_audatex, :integer
  	add_column :reports, :num_submitted_year_audatex, :integer

  	add_column :reports, :num_unsubmitted_all_ccc, :integer
  	add_column :reports, :num_unsubmitted_week_ccc, :integer
  	add_column :reports, :num_unsubmitted_month_ccc, :integer
  	add_column :reports, :num_unsubmitted_quarter_ccc, :integer
  	add_column :reports, :num_unsubmitted_year_ccc, :integer

  	add_column :reports, :num_unsubmitted_all_mitchell, :integer
  	add_column :reports, :num_unsubmitted_week_mitchell, :integer
  	add_column :reports, :num_unsubmitted_month_mitchell, :integer
  	add_column :reports, :num_unsubmitted_quarter_mitchell, :integer
  	add_column :reports, :num_unsubmitted_year_mitchell, :integer

  	add_column :reports, :num_unsubmitted_all_audatex, :integer
  	add_column :reports, :num_unsubmitted_week_audatex, :integer
  	add_column :reports, :num_unsubmitted_month_audatex, :integer
  	add_column :reports, :num_unsubmitted_quarter_audatex, :integer
  	add_column :reports, :num_unsubmitted_year_audatex, :integer
  end
end
