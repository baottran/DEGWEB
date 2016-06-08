class AddNewInquiriesReportingData < ActiveRecord::Migration
  def change
  	add_column :reports, :num_submitted_all_ccc, :decimal
  	add_column :reports, :num_submitted_week_ccc, :decimal
  	add_column :reports, :num_submitted_month_ccc, :decimal
  	add_column :reports, :num_submitted_quarter_ccc, :decimal
  	add_column :reports, :num_submitted_year_ccc, :decimal

  	add_column :reports, :num_submitted_all_mitchell, :decimal
  	add_column :reports, :num_submitted_week_mitchell, :decimal
  	add_column :reports, :num_submitted_month_mitchell, :decimal
  	add_column :reports, :num_submitted_quarter_mitchell, :decimal
  	add_column :reports, :num_submitted_year_mitchell, :decimal

  	add_column :reports, :num_submitted_all_audatex, :decimal
  	add_column :reports, :num_submitted_week_audatex, :decimal
  	add_column :reports, :num_submitted_month_audatex, :decimal
  	add_column :reports, :num_submitted_quarter_audatex, :decimal
  	add_column :reports, :num_submitted_year_audatex, :decimal

  	add_column :reports, :num_unsubmitted_all_ccc, :decimal
  	add_column :reports, :num_unsubmitted_week_ccc, :decimal
  	add_column :reports, :num_unsubmitted_month_ccc, :decimal
  	add_column :reports, :num_unsubmitted_quarter_ccc, :decimal
  	add_column :reports, :num_unsubmitted_year_ccc, :decimal

  	add_column :reports, :num_unsubmitted_all_mitchell, :decimal
  	add_column :reports, :num_unsubmitted_week_mitchell, :decimal
  	add_column :reports, :num_unsubmitted_month_mitchell, :decimal
  	add_column :reports, :num_unsubmitted_quarter_mitchell, :decimal
  	add_column :reports, :num_unsubmitted_year_mitchell, :decimal

  	add_column :reports, :num_unsubmitted_all_audatex, :decimal
  	add_column :reports, :num_unsubmitted_week_audatex, :decimal
  	add_column :reports, :num_unsubmitted_month_audatex, :decimal
  	add_column :reports, :num_unsubmitted_quarter_audatex, :decimal
  	add_column :reports, :num_unsubmitted_year_audatex, :decimal
  end
end
