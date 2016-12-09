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
    
    inquiries = Inquiry.where(database: db)
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
    
    inquiries = Inquiry.where(database: db)
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
    return Inquiry.database(database).open.not_internal 
  end 

  def self.num_closed(database)
    return Inquiry.database(database).closed.not_internal 
  end 

  def self.count_resolved_in(database, period)
    return Inquiry.database(database).resolved_in_last(period).count
  end

  def self.count_unresolved_in(database, period)
    return Inquiry.database(database).unresolved_in_last(period).count 
  end

  def self.num_original(db, period)
    inquiries = Inquiry.database(db)
    start_date = start_date_for(period)
    end_date = Time.now 

    return inquiries.where(status: 'Resolved (IP Change)').where(resolution_date: start_date..end_date).count
  end

  def self.num_repeat(db, period)
    inquiries = Inquiry.database(db)
    start_date = start_date_for(period)
    end_date = Time.now 
    
    return inquiries.where(status: 'Resolved (No IP Change)').where(resolution_date: start_date..end_date).count
  end



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
