class AddOriginalRepeatToReports < ActiveRecord::Migration
  def change

  	add_column :reports, :num_original_mitchell_all     , :int
    add_column :reports, :num_original_mitchell_week    , :int
    add_column :reports, :num_original_mitchell_month   , :int
    add_column :reports, :num_original_mitchell_quarter , :int
    add_column :reports, :num_original_mitchell_year    , :int

    add_column :reports, :num_repeat_mitchell_all       , :int
    add_column :reports, :num_repeat_mitchell_week      , :int
    add_column :reports, :num_repeat_mitchell_month     , :int
    add_column :reports, :num_repeat_mitchell_quarter   , :int
    add_column :reports, :num_repeat_mitchell_year      , :int

    add_column :reports, :num_original_ccc_all     , :int
    add_column :reports, :num_original_ccc_week    , :int
    add_column :reports, :num_original_ccc_month   , :int
    add_column :reports, :num_original_ccc_quarter , :int
    add_column :reports, :num_original_ccc_year    , :int

    add_column :reports, :num_repeat_ccc_all       , :int
    add_column :reports, :num_repeat_ccc_week      , :int
    add_column :reports, :num_repeat_ccc_month     , :int
    add_column :reports, :num_repeat_ccc_quarter   , :int
    add_column :reports, :num_repeat_ccc_year      , :int

    add_column :reports, :num_original_audatex_all     , :int
    add_column :reports, :num_original_audatex_week    , :int
    add_column :reports, :num_original_audatex_month   , :int
    add_column :reports, :num_original_audatex_quarter , :int
    add_column :reports, :num_original_audatex_year    , :int

    add_column :reports, :num_repeat_audatex_all       , :int
    add_column :reports, :num_repeat_audatex_week      , :int
    add_column :reports, :num_repeat_audatex_month     , :int
    add_column :reports, :num_repeat_audatex_quarter   , :int
    add_column :reports, :num_repeat_audatex_year      , :int
    
  end
end
