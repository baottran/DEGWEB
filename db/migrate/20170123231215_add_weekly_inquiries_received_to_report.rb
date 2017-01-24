class AddWeeklyInquiriesReceivedToReport < ActiveRecord::Migration
  def change
  	add_column :reports, :weekly_received_ccc     	, :int
  	add_column :reports, :weekly_received_mitchell	, :int 
  	add_column :reports, :weekly_received_audatex	, :int 
  	add_column :reports, :weekly_received_total		, :int

  	add_column :reports, :weekly_submitted_ccc     	, :int
  	add_column :reports, :weekly_submitted_mitchell	, :int 
  	add_column :reports, :weekly_submitted_audatex	, :int 
  	add_column :reports, :weekly_submitted_total	, :int

  	add_column :reports, :weekly_resolved_ccc     	, :int
  	add_column :reports, :weekly_resolved_mitchell	, :int 
  	add_column :reports, :weekly_resolved_audatex	, :int 
  	add_column :reports, :weekly_resolved_total		, :int

  	add_column :reports, :weekly_unresolved_ccc     	, :int
  	add_column :reports, :weekly_unresolved_mitchell	, :int 
  	add_column :reports, :weekly_unresolved_audatex		, :int 
  	add_column :reports, :weekly_unresolved_total		, :int

  	add_column :reports, :weekly_avg_submit_time_ccc     	, :decimal
  	add_column :reports, :weekly_avg_submit_time_mitchell	, :decimal 
  	add_column :reports, :weekly_avg_submit_time_audatex	, :decimal 

  	add_column :reports, :weekly_avg_resolve_time_ccc     	, :decimal
  	add_column :reports, :weekly_avg_resolve_time_mitchell	, :decimal 
  	add_column :reports, :weekly_avg_resolve_time_audatex	, :decimal 
  end
end
