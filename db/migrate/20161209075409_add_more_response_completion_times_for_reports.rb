class AddMoreResponseCompletionTimesForReports < ActiveRecord::Migration
  def change
    add_column :reports, :avg_response_mitchell_week    , :int
    add_column :reports, :avg_response_mitchell_month   , :int
    add_column :reports, :avg_response_mitchell_quarter , :int
    add_column :reports, :avg_response_mitchell_year    , :int

    add_column :reports, :avg_completion_mitchell_week      , :int
    add_column :reports, :avg_completion_mitchell_month     , :int
    add_column :reports, :avg_completion_mitchell_quarter   , :int
    add_column :reports, :avg_completion_mitchell_year      , :int

    add_column :reports, :avg_response_ccc_week    , :int
    add_column :reports, :avg_response_ccc_month   , :int
    add_column :reports, :avg_response_ccc_quarter , :int
    add_column :reports, :avg_response_ccc_year    , :int

    add_column :reports, :avg_completion_ccc_week      , :int
    add_column :reports, :avg_completion_ccc_month     , :int
    add_column :reports, :avg_completion_ccc_quarter   , :int
    add_column :reports, :avg_completion_ccc_year      , :int

    add_column :reports, :avg_response_audatex_week    , :int
    add_column :reports, :avg_response_audatex_month   , :int
    add_column :reports, :avg_response_audatex_quarter , :int
    add_column :reports, :avg_response_audatex_year    , :int

    add_column :reports, :avg_completion_audatex_week      , :int
    add_column :reports, :avg_completion_audatex_month     , :int
    add_column :reports, :avg_completion_audatex_quarter   , :int
    add_column :reports, :avg_completion_audatex_year      , :int
  end
end
