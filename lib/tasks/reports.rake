require "#{Rails.root}/app/helpers/inquiries_helper"
include InquiriesHelper

namespace :reports do
  desc "TODO"
  task :my_task1 => :environment do
  	p ""
  end

  desc "TODO"
  task :my_task2 => :environment do
  	p "2"
  end

  task :init => :environment do
  	r = Report.new 
  	r.save 
  	p r 
  end

  task :count => :environment do 
  	r = Report.find(1)
  	r.all_count = Inquiry.all.count
  	r.received_count = Inquiry.where(status: 'Received by DEG').count
  	r.submitted_count = Inquiry.where(status: 'Submitted to IP').count
  	r.responded_count = Inquiry.where(status: 'IP Response Received').count
  	r.ip_change_count = Inquiry.where(status: 'Resolved (IP Change)').count 
  	r.no_change_count = Inquiry.where(status: 'Resolved (No IP Change)').count 
  	r.save
  	p r 
  end

  task :generate => :environment do 
    get_response_and_completion_times
    get_submitted_unsubmitted_counts

  	p Report.find(1)
  end

  task :show_inquiries => :environment do
    inquiries = Inquiry.all 

    inquiries.each do |i|
      i.show_on_web = true 
      i.save 
    end

    p "finished"
  end

  task :update_search => :environment do 

    inquiries = Inquiry.all 

    inquiries.each do |i|
      i.set_admin_search_criteria
      i.save 
    end

    p 'finished'
  end

  task :calculate => :environment do 
     "\n=========\nstart calcualting reports\n=========\n"
    Report.generate_weekly_report
    Report.set_response_and_completion_times
    Report.set_open_and_closed_counts
    Report.set_original_repeat_counts
    get_submitted_unsubmitted_counts
    Report.set_total_counts
    p "\n=========\ndone calcualting reports\n=========\n"
  end

  task :send_snapshot => :environment do 
    InquiryMailer.weekly_report.deliver 
  end

  task :fix => :environment do 

    received = [[10383, 26], [10384, 26], [10385, 27], [10386, 27], [10387, 27], [10388, 27], [10389, 27], [10390, 27], [10391, 27]]

    received.each do |inquiry_num, day|
      i = Inquiry.find(inquiry_num)
      i.status = "Received by DEG"
      i.created_at = Date.new(2017,01,day)
      i.submit_to_ip_date = nil 
      i.resolution_date = nil 
      i.save 
      p "saved #{inquiry_num}"
    end

    submitted = [10360, 10352, 10344, 10334, 10273, 10198, 10116, 10095, 9991, 9946, 9817, 9801, 9708]

    submitted.each do |inquiry_num|
      i = Inquiry.find(inquiry_num)
      i.resolution_date = nil 
      i.save
    end

    p "done"
  end

  task :fix2 => :environment do 

    i = Inquiry.where(status: "Received by DEG")

    inqs = []

    i.each do |inq|
      if i.resolution_date > (Date.today - 2.days)
        i.status = "Received by DEG"
        i.submit_to_ip_date = nil 
        i.save 
        inqs.push(i.id) 
      end
    end

    p "fixed ids #{inqs}"

  end


  # Generate Methods


  def get_submitted_unsubmitted_counts
    r = Report.find(1)

    r.num_submitted_all_ccc           = num_submitted("CCC", nil, nil)
    r.num_submitted_week_ccc          = num_submitted("CCC", "Week", nil)               
    r.num_submitted_month_ccc         = num_submitted("CCC", "Month", nil)
    r.num_submitted_quarter_ccc       = num_submitted("CCC", "Quarter", nil)
    r.num_submitted_year_ccc          = num_submitted("CCC", "Year", nil)
            
    r.num_submitted_all_mitchell      = num_submitted("Mitchell", nil, nil)         
    r.num_submitted_week_mitchell     = num_submitted("Mitchell", "Week", nil)         
    r.num_submitted_month_mitchell    = num_submitted("Mitchell", "Month", nil)       
    r.num_submitted_quarter_mitchell  = num_submitted("Mitchell", "Quarter", nil)         
    r.num_submitted_year_mitchell     = num_submitted("Mitchell", "Year", nil)     
            
    r.num_submitted_all_audatex       = num_submitted("Audatex", nil, nil)   
    r.num_submitted_week_audatex      = num_submitted("Audatex", "Week", nil)         
    r.num_submitted_month_audatex     = num_submitted("Audatex", "Month", nil)     
    r.num_submitted_quarter_audatex   = num_submitted("Audatex", "Quarter", nil)       
    r.num_submitted_year_audatex      = num_submitted("Audatex", "Year", nil)     

    r.num_unsubmitted_all_ccc         = num_unsubmitted("CCC", nil, nil)
    r.num_unsubmitted_week_ccc        = num_unsubmitted("CCC", "Week", nil)
    r.num_unsubmitted_month_ccc       = num_unsubmitted("CCC", "Month", nil)
    r.num_unsubmitted_quarter_ccc     = num_unsubmitted("CCC", "Quarter", nil)
    r.num_unsubmitted_year_ccc        = num_unsubmitted("CCC", "Year", nil)

    r.num_unsubmitted_all_mitchell      = num_unsubmitted("Mitchell", nil, nil)
    r.num_unsubmitted_week_mitchell     = num_unsubmitted("Mitchell", "Week", nil)
    r.num_unsubmitted_month_mitchell    = num_unsubmitted("Mitchell", "Month", nil)
    r.num_unsubmitted_quarter_mitchell  = num_unsubmitted("Mitchell", "Quarter", nil)
    r.num_unsubmitted_year_mitchell     = num_unsubmitted("Mitchell", "Year", nil)

    r.num_unsubmitted_all_audatex       = num_unsubmitted("Audatex", nil, nil)
    r.num_unsubmitted_week_audatex      = num_unsubmitted("Audatex", "Week", nil)
    r.num_unsubmitted_month_audatex     = num_unsubmitted("Audatex", "Month", nil)
    r.num_unsubmitted_quarter_audatex   = num_unsubmitted("Audatex", "Quarter", nil)
    r.num_unsubmitted_year_audatex      = num_unsubmitted("Audatex", "Year", nil)

    r.save 
  end

end
