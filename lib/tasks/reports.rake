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
  	r = Report.find(1)
  	r.avg_response_ccc = time_to_days(avg_response_time_for("CCC"))
  	r.avg_response_audatex = time_to_days(avg_response_time_for("Audatex"))
  	r.avg_response_mitchell = time_to_days(avg_response_time_for("Mitchell"))
  	r.avg_completion_ccc = time_to_days(avg_completion_time_for("CCC"))
  	r.avg_completion_mitchell = time_to_days(avg_completion_time_for("Mitchell"))
  	r.avg_completion_audatex = time_to_days(avg_completion_time_for("Audatex"))
  	r.save 

  	p r 
  end

  # helper methods

  def avg_response_time_for(db)
    responded_inquiries = Inquiry.where(database: db).where.not(submit_to_ip_date: nil)

    total_response_time = 0

    responded_inquiries.each do |inquiry|
        response_time = inquiry.submit_to_ip_date - inquiry.created_at
        total_response_time = total_response_time + response_time
    end

    if responded_inquiries.count != 0 
      avg_response_time = total_response_time / responded_inquiries.count
    elsif  
      avg_response_time = 0
    end

    return avg_response_time
  end

    def avg_completion_time_for(db)
    completed_inquiries = Inquiry.where(database: db).where.not(resolution_date: nil)

    total_completion_time = 0 

    completed_inquiries.each do |inquiry|
      completion_time = inquiry.resolution_date - inquiry.created_at
      total_completion_time = completion_time + total_completion_time
    end

    if completed_inquiries.count != 0 
      avg_completion_time = total_completion_time / completed_inquiries.count
    else
      avg_completion_time = 0
    end

    return avg_completion_time
  end

  def time_to_days(time)
    return (time / 86400).round(2)
  end

  def get_submitted_unsubmitted_counts
    r = Report.find(1)

    r.num_submitted_all_ccc
    r.num_submitted_week_ccc
    r.num_submitted_month_ccc
    r.num_submitted_quarter_ccc
    r.num_submitted_year_ccc
    r.num_submitted_all_mitchell
    r.num_submitted_week_mitchell
    r.num_submitted_month_mitchell
    r.num_submitted_quarter_mitchell
    r.num_submitted_year_mitchell
    r.num_submitted_all_audatex
    r.num_submitted_week_audatex
    r.num_submitted_month_audatex
    r.num_submitted_quarter_audatex
    r.num_submitted_year_audatex
    r.num_unsubmitted_all_ccc
    r.num_unsubmitted_week_ccc
    r.num_unsubmitted_month_ccc
    r.num_unsubmitted_quarter_ccc
    r.num_unsubmitted_year_ccc
    r.num_unsubmitted_all_mitchell
    r.num_unsubmitted_week_mitchell
    r.num_unsubmitted_month_mitchell
    r.num_unsubmitted_quarter_mitchell
    r.num_unsubmitted_year_mitchell
    r.num_unsubmitted_all_audatex
    r.num_unsubmitted_week_audatex
    r.num_unsubmitted_month_audatex
    r.num_unsubmitted_quarter_audatex
    r.num_unsubmitted_year_audatex

    r.save 

  end

 
end
