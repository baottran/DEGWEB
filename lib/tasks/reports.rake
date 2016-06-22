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

  # Generate Methods

  def get_response_and_completion_times
    r = Report.find(1)
    r.avg_response_ccc = time_to_days(avg_response_time_for("CCC"))
    r.avg_response_audatex = time_to_days(avg_response_time_for("Audatex"))
    r.avg_response_mitchell = time_to_days(avg_response_time_for("Mitchell"))
    r.avg_completion_ccc = time_to_days(avg_completion_time_for("CCC"))
    r.avg_completion_mitchell = time_to_days(avg_completion_time_for("Mitchell"))
    r.avg_completion_audatex = time_to_days(avg_completion_time_for("Audatex"))
    r.save 
  end

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
    else  
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

  def num_submitted(db = nil, timeframe = nil, end_date = nil)
    return inquiries_for_timeframe(db, timeframe, end_date).count - num_unsubmitted(db, timeframe, end_date)
  end

  def num_unsubmitted(db = nil, timeframe = nil, end_date = nil)    
    return inquiries_for_timeframe(db, timeframe, end_date).where(submit_to_ip_date: nil).count
  end

  def inquiries_for_timeframe(db = nil, timeframe = nil, end_date = nil)
    if timeframe.present? 
        if timeframe === "Week"
            start_date = (Time.now - 1.week).beginning_of_day 
        elsif timeframe === "Month"
            start_date = (Time.now - 1.month).beginning_of_day 
        elsif timeframe === "Quarter"
            start_date = (Time.now - 84.days).beginning_of_day 
        elsif timeframe === "Year"
            start_date = (Time.now - 1.year).beginning_of_day 
        end

        if end_date.present?
            inquiries = Inquiry.where(created_at: start_date..Date.parse(end_date).end_of_day)
        else
            inquiries = Inquiry.where(created_at: start_date..Date.today.end_of_day)
        end

        inquiries = inquiries.where(database: db)
    else

        if end_date.present?
            puts "====================="
            puts start_date
            puts end_date
            puts Date.parse(end_date)

            inquiries = Inquiry.where("created_at <= ?", Date.parse(end_date).end_of_day)
        else
            inquiries = Inquiry.where("created_at <= ?", Date.today.end_of_day)
        end

        inquiries = inquiries.where(database: db)
    end

    return inquiries
  end


 
end
