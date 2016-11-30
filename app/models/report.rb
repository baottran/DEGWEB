class Report < ActiveRecord::Base

	def self.set_response_and_completion_times 
		r = Report.find(1)
	  r.avg_response_ccc 				= self.avg_response_time_for("CCC")
	  r.avg_response_audatex 		= self.avg_response_time_for("Audatex")
	  r.avg_response_mitchell 	= self.avg_response_time_for("Mitchell")
	  r.avg_completion_ccc 			= self.avg_completion_time_for("CCC")
	  r.avg_completion_mitchell = self.avg_completion_time_for("Mitchell")
	  r.avg_completion_audatex 	= self.avg_completion_time_for("Audatex")
		r.save 
	end

	def self.avg_response_time_for(db)
    responded_inquiries = Inquiry.where(database: db).where.not(submit_to_ip_date: nil)

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

  def self.avg_completion_time_for(db)
    completed_inquiries = Inquiry.where(database: db).where.not(resolution_date: nil)

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



  private 

  def self.format_date(date)
  	return Date.parse(date.beginning_of_day.to_s)
  end

end
