class Report < ActiveRecord::Base

  # RESPONSE AND COMPLETION TIMES

	def self.set_response_and_completion_times 
		r = Report.find(1)
	  r.avg_response_ccc 				  = self.avg_response_time_for("CCC", "all")
    r.avg_response_ccc_week     = self.avg_response_time_for("CCC", "week")
    r.avg_response_ccc_month     = self.avg_response_time_for("CCC", "month")
    r.avg_response_ccc_quarter     = self.avg_response_time_for("CCC", "quarter")
    r.avg_response_ccc_year     = self.avg_response_time_for("CCC", "year")

    r.avg_response_audatex          = self.avg_response_time_for("Audatex", "all")
    r.avg_response_audatex_week     = self.avg_response_time_for("Audatex", "week")
    r.avg_response_audatex_month     = self.avg_response_time_for("Audatex", "month")
    r.avg_response_audatex_quarter     = self.avg_response_time_for("Audatex", "quarter")
    r.avg_response_audatex_year     = self.avg_response_time_for("Audatex", "year")

    r.avg_response_mitchell          = self.avg_response_time_for("Mitchell", "all")
    r.avg_response_mitchell_week     = self.avg_response_time_for("Mitchell", "week")
    r.avg_response_mitchell_month     = self.avg_response_time_for("Mitchell", "month")
    r.avg_response_mitchell_quarter     = self.avg_response_time_for("Mitchell", "quarter")
    r.avg_response_mitchell_year     = self.avg_response_time_for("Mitchell", "year")

    r.avg_completion_ccc          = self.avg_completion_time_for("CCC", "all")
    r.avg_completion_ccc_week     = self.avg_completion_time_for("CCC", "week")
    r.avg_completion_ccc_month     = self.avg_completion_time_for("CCC", "month")
    r.avg_completion_ccc_quarter     = self.avg_completion_time_for("CCC", "quarter")
    r.avg_completion_ccc_year     = self.avg_completion_time_for("CCC", "year")

    r.avg_completion_audatex          = self.avg_completion_time_for("Audatex", "all")
    r.avg_completion_audatex_week     = self.avg_completion_time_for("Audatex", "week")
    r.avg_completion_audatex_month     = self.avg_completion_time_for("Audatex", "month")
    r.avg_completion_audatex_quarter     = self.avg_completion_time_for("Audatex", "quarter")
    r.avg_completion_audatex_year     = self.avg_completion_time_for("Audatex", "year")

    r.avg_completion_mitchell          = self.avg_completion_time_for("Mitchell", "all")
    r.avg_completion_mitchell_week     = self.avg_completion_time_for("Mitchell", "week")
    r.avg_completion_mitchell_month     = self.avg_completion_time_for("Mitchell", "month")
    r.avg_completion_mitchell_quarter     = self.avg_completion_time_for("Mitchell", "quarter")
    r.avg_completion_mitchell_year     = self.avg_completion_time_for("Mitchell", "year")

		r.save 
	end

	def self.avg_response_time_for(db, period)

    start_date = start_date_for(period)
    end_date = Time.now 
    
    inquiries = Inquiry.new_db.where(database: db)
    responded_inquiries = inquiries.where.not(submit_to_ip_date: nil).where(submit_to_ip_date: start_date..end_date)

    if responded_inquiries.count == 0 
    	return 0 
    end 

    total_response_time = 0

    responded_inquiries.each do |inquiry|
  		create_date = self.format_date(inquiry.created_at)
  		response_date = self.format_date(inquiry.submit_to_ip_date)
      response_time = create_date.business_dates_until(response_date).count
      total_response_time += response_time
    end

    return total_response_time / responded_inquiries.count  
  end

  def self.avg_completion_time_for(db, period)

    start_date = start_date_for(period)
    end_date = Time.now 
    
    inquiries = Inquiry.new_db.where(database: db)
    completed_inquiries = inquiries.where.not(resolution_date: nil).where(resolution_date: start_date..end_date)

    if completed_inquiries.count == 0 
    	return 0 
    end 

    total_completion_time = 0

    completed_inquiries.each do |inquiry|
  		create_date = self.format_date(inquiry.created_at)
  		completion_date = self.format_date(inquiry.resolution_date)
      completion_time = create_date.business_dates_until(completion_date).count
      total_completion_time += completion_time
    end

    return total_completion_time / completed_inquiries.count  
  end

  # OPEN / CLOSED COUNTS
  def self.set_open_and_closed_counts
    p "starting"
    r = Report.find(1)
    r.num_open_audatex_all      = self.num_open("Audatex").count
    r.num_open_audatex_week     = self.count_unresolved_in("Audatex", "week")
    r.num_open_audatex_month    = self.count_unresolved_in("Audatex", "month")
    r.num_open_audatex_quarter  = self.count_unresolved_in("Audatex", "quarter")
    r.num_open_audatex_year     = self.count_unresolved_in("Audatex", "year")

    r.num_open_ccc_all          = self.num_open("CCC").count
    r.num_open_ccc_week         = self.count_unresolved_in("CCC", "week")
    r.num_open_ccc_month        = self.count_unresolved_in("CCC", "month")
    r.num_open_ccc_quar         = self.count_unresolved_in("CCC", "quarter")
    r.num_open_ccc_year         = self.count_unresolved_in("CCC", "year")

    r.num_open_mitchell_all     = self.num_open("Mitchell").count
    r.num_open_mitchell_week    = self.count_unresolved_in("Mitchell", "week")
    r.num_open_mitchell_month   = self.count_unresolved_in("Mitchell", "month") 
    r.num_open_mitchell_quar    = self.count_unresolved_in("Mitchell", "quarter")
    r.num_open_mitchell_year    = self.count_unresolved_in("Mitchell", "year")

    r.num_resolved_audatex_all      = self.num_closed("Audatex").count
    r.num_resolved_audatex_week     = self.count_resolved_in("Audatex", "week")
    r.num_resolved_audatex_month    = self.count_resolved_in("Audatex", "month")
    r.num_resolved_audatex_quarter  = self.count_resolved_in("Audatex", "quarter")
    r.num_resolved_audatex_year     = self.count_resolved_in("Audatex", "year")

    r.num_resolved_ccc_all          = self.num_closed("CCC").count
    r.num_resolved_ccc_week         = self.count_resolved_in("CCC", "week")
    r.num_resolved_ccc_month        = self.count_resolved_in("CCC", "month")
    r.num_resolved_ccc_quar         = self.count_resolved_in("CCC", "quarter")
    r.num_resolved_ccc_year         = self.count_resolved_in("CCC", "year")

    r.num_resolved_mitchell_all     = self.num_closed("Mitchell").count
    r.num_resolved_mitchell_week    = self.count_resolved_in("Mitchell", "week")
    r.num_resolved_mitchell_month   = self.count_resolved_in("Mitchell", "month") 
    r.num_resolved_mitchell_quar    = self.count_resolved_in("Mitchell", "quarter")
    r.num_resolved_mitchell_year    = self.count_resolved_in("Mitchell", "year")

    r.save 
    p "done"
  end

  def self.set_original_repeat_counts
    r = Report.find(1)
    r.num_original_mitchell_all       = self.num_original("Mitchell", "all")
    r.num_original_mitchell_week      = self.num_original("Mitchell", "week")
    r.num_original_mitchell_month     = self.num_original("Mitchell", "month")
    r.num_original_mitchell_quarter   = self.num_original("Mitchell", "quarter")
    r.num_original_mitchell_year      = self.num_original("Mitchell", "year")

    r.num_repeat_mitchell_all       = self.num_repeat("Mitchell", "all")
    r.num_repeat_mitchell_week      = self.num_repeat("Mitchell", "week")
    r.num_repeat_mitchell_month     = self.num_repeat("Mitchell", "month")
    r.num_repeat_mitchell_quarter   = self.num_repeat("Mitchell", "quarter")
    r.num_repeat_mitchell_year      = self.num_repeat("Mitchell", "year")

    r.num_original_ccc_all       = self.num_original("CCC", "all")
    r.num_original_ccc_week      = self.num_original("CCC", "week")
    r.num_original_ccc_month     = self.num_original("CCC", "month")
    r.num_original_ccc_quarter   = self.num_original("CCC", "quarter")
    r.num_original_ccc_year      = self.num_original("CCC", "year")

    r.num_repeat_ccc_all       = self.num_repeat("CCC", "all")
    r.num_repeat_ccc_week      = self.num_repeat("CCC", "week")
    r.num_repeat_ccc_month     = self.num_repeat("CCC", "month")
    r.num_repeat_ccc_quarter   = self.num_repeat("CCC", "quarter")
    r.num_repeat_ccc_year      = self.num_repeat("CCC", "year")

    r.num_original_audatex_all       = self.num_original("Audatex", "all")
    r.num_original_audatex_week      = self.num_original("Audatex", "week")
    r.num_original_audatex_month     = self.num_original("Audatex", "month")
    r.num_original_audatex_quarter   = self.num_original("Audatex", "quarter")
    r.num_original_audatex_year      = self.num_original("Audatex", "year")

    r.num_repeat_audatex_all       = self.num_repeat("Audatex", "all")
    r.num_repeat_audatex_week      = self.num_repeat("Audatex", "week")
    r.num_repeat_audatex_month     = self.num_repeat("Audatex", "month")
    r.num_repeat_audatex_quarter   = self.num_repeat("Audatex", "quarter")
    r.num_repeat_audatex_year      = self.num_repeat("Audatex", "year")

    r.save
  end

  def self.num_open(database)
    return Inquiry.new_db.database(database).open.not_internal 
  end 

  def self.num_closed(database)
    return Inquiry.new_db.database(database).closed.not_internal 
  end 

  def self.count_resolved_in(database, period)
    return Inquiry.new_db.database(database).resolved_in_last(period).count
  end

  def self.count_unresolved_in(database, period)
    return Inquiry.new_db.database(database).unresolved_in_last(period).count 
  end

  def self.num_original(db, period)
    inquiries = Inquiry.database(db).new_db
    start_date = start_date_for(period)
    end_date = Time.now 

    return inquiries.where(status: 'Resolved (IP Change)').where(resolution_date: start_date..end_date).count
  end

  def self.num_repeat(db, period)
    inquiries = Inquiry.database(db).new_db
    start_date = start_date_for(period)
    end_date = Time.now 
    
    return inquiries.where(status: 'Resolved (No IP Change)').where(resolution_date: start_date..end_date).count
  end

  def self.generate_weekly_report
    r = Report.find(1)

    week_start = self.weekly_report_start_date
    end_date = DateTime.now 

    # inquiries received by IP 

    r.weekly_received_ccc  = Inquiry.where(database: 'CCC').where(created_at: week_start..end_date).count
    r.weekly_received_audatex  = Inquiry.where(database: 'Audatex').where(created_at: week_start..end_date).count
    r.weekly_received_mitchell  = Inquiry.where(database: 'Mitchell').where(created_at: week_start..end_date).count

    # total inquiries received

    r.weekly_received_total = r.weekly_received_ccc + r.weekly_received_audatex + r.weekly_received_mitchell

    # inquiries submitted

    r.weekly_submitted_ccc      = Inquiry.new_db.where(database: 'CCC').where(submit_to_ip_date: week_start..end_date).count
    r.weekly_submitted_audatex  = Inquiry.new_db.where(database: 'Audatex').where(submit_to_ip_date: week_start..end_date).count
    r.weekly_submitted_mitchell = Inquiry.new_db.where(database: 'Mitchell').where(submit_to_ip_date: week_start..end_date).count

    r.weekly_submitted_total    = r.weekly_submitted_ccc + r.weekly_submitted_audatex + r.weekly_submitted_mitchell

    r.weekly_resolved_ccc       = Inquiry.new_db.where(database: 'CCC').where(submit_to_ip_date: week_start..end_date).count
    r.weekly_resolved_audatex   = Inquiry.new_db.where(database: 'Audatex').where(submit_to_ip_date: week_start..end_date).count
    r.weekly_resolved_mitchell  = Inquiry.new_db.where(database: 'Mitchell').where(submit_to_ip_date: week_start..end_date).count
    r.weekly_resolved_total     = r.weekly_resolved_ccc + r.weekly_resolved_audatex + r.weekly_resolved_mitchell

    r.weekly_avg_submit_time_ccc      = self.weekly_avg_submit_time('CCC')
    r.weekly_avg_submit_time_audatex  = self.weekly_avg_submit_time('Audatex')
    r.weekly_avg_submit_time_mitchell = self.weekly_avg_submit_time('Mitchell')

    r.weekly_avg_resolve_time_audatex = self.weekly_avg_resolve_time('Audatex')
    r.weekly_avg_resolve_time_ccc     = self.weekly_avg_resolve_time('CCC')
    r.weekly_avg_resolve_time_mitchell = self.weekly_avg_resolve_time('Mitchell')

    r.save 
  end


  def self.weekly_report_start_date
    return Date.today.beginning_of_week(:monday)
  end

  def self.weekly_avg_submit_time(db)
    inquiries = Inquiry.new_db.where(database: db).where(submit_to_ip_date: (Date.today - 30.days)..Date.today)
    total_time = 0 

    inquiries.each do |i|
      create_date = Date.parse(i.created_at.to_s)
      submit_date = Date.parse(i.submit_to_ip_date.to_s)
      submit_time = create_date.business_dates_until(submit_date).count 
      total_time += submit_time 
    end

    return total_time.to_f / inquiries.count.to_f 
  end

  def self.weekly_avg_resolve_time(db)
    inquiries = Inquiry.new_db.where(database: db).where(resolution_date: (Date.today - 30.days)..Date.today)
    total_time = 0

    inquiries.each do |i|
      create_date = Date.parse(i.created_at.to_s)
      resolution_date = Date.parse(i.resolution_date.to_s)
      res_time = create_date.business_dates_until(resolution_date).count
      total_time += res_time
    end

    return total_time.to_f / inquiries.count.to_f
  end

  def self.set_total_counts 
    r = Report.find(1)
    r.all_count = Inquiry.new_db.all.count
    r.received_count = Inquiry.new_db.where(status: 'Received by DEG').count
    r.submitted_count = Inquiry.new_db.where(status: 'Submitted to IP').count
    r.responded_count = Inquiry.new_db.where(status: 'IP Response Received').count
    r.ip_change_count = Inquiry.new_db.where(status: 'Resolved (IP Change)').count 
    r.no_change_count = Inquiry.new_db.where(status: 'Resolved (No IP Change)').count
    r.deg_resolved_count = Inquiry.new_db.where(status: 'Resolved (DEG Response)').count 
    r.save 
  end

  # def self.set_submitted_unsubmitted_counts
  #   r = Report.find(1)

  #   r.num_submitted_all_ccc           = num_submitted("CCC", nil, nil)
  #   r.num_submitted_week_ccc          = num_submitted("CCC", "Week", nil)               
  #   r.num_submitted_month_ccc         = num_submitted("CCC", "Month", nil)
  #   r.num_submitted_quarter_ccc       = num_submitted("CCC", "Quarter", nil)
  #   r.num_submitted_year_ccc          = num_submitted("CCC", "Year", nil)
            
  #   r.num_submitted_all_mitchell      = num_submitted("Mitchell", nil, nil)         
  #   r.num_submitted_week_mitchell     = num_submitted("Mitchell", "Week", nil)         
  #   r.num_submitted_month_mitchell    = num_submitted("Mitchell", "Month", nil)       
  #   r.num_submitted_quarter_mitchell  = num_submitted("Mitchell", "Quarter", nil)         
  #   r.num_submitted_year_mitchell     = num_submitted("Mitchell", "Year", nil)     
            
  #   r.num_submitted_all_audatex       = num_submitted("Audatex", nil, nil)   
  #   r.num_submitted_week_audatex      = num_submitted("Audatex", "Week", nil)         
  #   r.num_submitted_month_audatex     = num_submitted("Audatex", "Month", nil)     
  #   r.num_submitted_quarter_audatex   = num_submitted("Audatex", "Quarter", nil)       
  #   r.num_submitted_year_audatex      = num_submitted("Audatex", "Year", nil)     

  #   r.num_unsubmitted_all_ccc         = num_unsubmitted("CCC", nil, nil)
  #   r.num_unsubmitted_week_ccc        = num_unsubmitted("CCC", "Week", nil)
  #   r.num_unsubmitted_month_ccc       = num_unsubmitted("CCC", "Month", nil)
  #   r.num_unsubmitted_quarter_ccc     = num_unsubmitted("CCC", "Quarter", nil)
  #   r.num_unsubmitted_year_ccc        = num_unsubmitted("CCC", "Year", nil)

  #   r.num_unsubmitted_all_mitchell      = num_unsubmitted("Mitchell", nil, nil)
  #   r.num_unsubmitted_week_mitchell     = num_unsubmitted("Mitchell", "Week", nil)
  #   r.num_unsubmitted_month_mitchell    = num_unsubmitted("Mitchell", "Month", nil)
  #   r.num_unsubmitted_quarter_mitchell  = num_unsubmitted("Mitchell", "Quarter", nil)
  #   r.num_unsubmitted_year_mitchell     = num_unsubmitted("Mitchell", "Year", nil)

  #   r.num_unsubmitted_all_audatex       = num_unsubmitted("Audatex", nil, nil)
  #   r.num_unsubmitted_week_audatex      = num_unsubmitted("Audatex", "Week", nil)
  #   r.num_unsubmitted_month_audatex     = num_unsubmitted("Audatex", "Month", nil)
  #   r.num_unsubmitted_quarter_audatex   = num_unsubmitted("Audatex", "Quarter", nil)
  #   r.num_unsubmitted_year_audatex      = num_unsubmitted("Audatex", "Year", nil)

  #   r.save 
  # end



  private 

  def self.format_date(date)
  	return Date.parse(date.beginning_of_day.to_s)
  end

    def self.start_date_for(period)
    end_date = Time.now
    if period == "week"
      return (end_date - 1.week).beginning_of_day
    elsif period == "month"
      return (end_date - 1.month).beginning_of_day
    elsif period == "quarter"
      return (end_date - 3.months).beginning_of_day
    elsif period == "year"
      return (end_date - 1.year).beginning_of_day
    elsif period == "all"
      return (end_date - 20.year).beginning_of_day    
    end
  end

end
