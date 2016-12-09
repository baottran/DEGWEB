class AddCompletionOpenFieldsToReport < ActiveRecord::Migration
   def change
  	p "what what"
  	add_column :reports, :num_open_audatex_all, :int
  	add_column :reports, :num_open_audatex_week, :int	
  	add_column :reports, :num_open_audatex_month, :int
  	add_column :reports, :num_open_audatex_quarter, :int	
  	add_column :reports, :num_open_audatex_year, :int

  	add_column :reports, :num_open_ccc_all, :int
  	add_column :reports, :num_open_ccc_week, :int
  	add_column :reports, :num_open_ccc_month, :int
  	add_column :reports, :num_open_ccc_quar, :int
  	add_column :reports, :num_open_ccc_year, :int

  	add_column :reports, :num_open_mitchell_all, :int
  	add_column :reports, :num_open_mitchell_week, :int
  	add_column :reports, :num_open_mitchell_month, :int
  	add_column :reports, :num_open_mitchell_quar, :int
  	add_column :reports, :num_open_mitchell_year, :int

	add_column :reports, :num_resolved_audatex_all, :int
  	add_column :reports, :num_resolved_audatex_week, :int	
  	add_column :reports, :num_resolved_audatex_month, :int
  	add_column :reports, :num_resolved_audatex_quarter, :int	
  	add_column :reports, :num_resolved_audatex_year, :int

  	add_column :reports, :num_resolved_ccc_all, :int
  	add_column :reports, :num_resolved_ccc_week, :int
  	add_column :reports, :num_resolved_ccc_month, :int
  	add_column :reports, :num_resolved_ccc_quar, :int
  	add_column :reports, :num_resolved_ccc_year, :int

  	add_column :reports, :num_resolved_mitchell_all, :int
  	add_column :reports, :num_resolved_mitchell_week, :int
  	add_column :reports, :num_resolved_mitchell_month, :int
  	add_column :reports, :num_resolved_mitchell_quar, :int
  	add_column :reports, :num_resolved_mitchell_year, :int
  end
end
