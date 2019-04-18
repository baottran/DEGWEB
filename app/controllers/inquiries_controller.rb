class InquiriesController < ApplicationController
  respond_to :html, :js
  helper_method :sort_column, :sort_direction
  include InquiriesHelper

  # before_filter :set_construction 


  def set_construction
    render 'construction'
  end


	def index
    @inquiries = find_inquiries
    @inquiries = @inquiries.order(sort_column + " " + sort_direction)
    @inquiries = @inquiries.paginate(:per_page => 20, :page => params[:page])

		# comment out due to inital rails s with no report on running on local server
#     @report = Report.find(1)
  end

  def find_inquiries()   
    inquiries = Inquiry.all 

    if params[:search].present?
      if logged_in? 
        inquiries = Inquiry.admin_search(params[:search])
      else
        inquiries = Inquiry.search(params[:search])
      end
    end

    inquiries = inquiries.where(show_on_web: true) if (logged_in? === false)

    inquiries = inquiries.where(status: params[:status]) if params[:status].present? 
    inquiries = inquiries.where(database: params[:database]) if params[:database].present?
    inquiries = inquiries.where(inquiry_type: params[:inquiry_type]) if params[:inquiry_type].present?
    inquiries = inquiries.where(make: params[:make]) if params[:make].present?

    if params[:filter_date_type].present? 
      inquiries = inquiries.where("#{params[:filter_date_type]} >= ?", params[:date_start]) if params[:date_start].present?

      if params[:date_end].present?
        end_date = Date.parse(params[:date_end]) if params[:date_end]
        end_date = end_date.end_of_day
        inquiries = inquiries.where("#{params[:filter_date_type]} <= ?", end_date) if params[:date_end].present?
      end
      
    end

    # BUG: area of vehicle search doesn't work. For some reason it can search "Other" but not any other area of vehicle types

    # inquiries = inquiries.where(['area_of_vehicle LIKE ?', params[:area_of_vehicle]]) if params[:area_of_vehicle].present?
    # inquiries = inquiries.where(area_of_vehicle: params[:area_of_vehicle]) if params[:area_of_vehicle].present?

    inquiries
  end 

  def find_unsubmitted_inquiries(db = nil)
    if db.present? 
      inquiries = Inquiry.where(status: 'Received by DEG', database: db)
    else
      inquiries = Inquiry.where(status: 'Received by DEG')
    end

    inquiries
  end

	def show
    @inquiry = Inquiry.find(params[:id])

    if logged_in? 
      @comments = @inquiry.comments
    else 
      @comments = @inquiry.comments.where(internal_only: false)
    end

    if logged_in? || @inquiry.show_on_web === true || params[:ip] === "review"
      render 'show'
    else 
      redirect_to action: "index"
    end
  end

	def new
    @status = Status.shared

    if @status.activated 
      flash["status"] = @status.text
    end

    @inquiry = Inquiry.new
	end

  def edit
    @inquiry = Inquiry.find(params[:id])
  end

  def update
    @inquiry = Inquiry.find(params[:id])

    if @inquiry.update(inquiry_params)
      redirect_to @inquiry
    else
      render 'edit'
    end
  end

  def attach
    @inquiry = Inquiry.find(params[:id])
  end


	def create
  	@inquiry = Inquiry.new(inquiry_params)
    @inquiry.vin = inquiry_params[:vin].upcase
    if @inquiry.save
      InquiryMailer.new_inquiry(@inquiry).deliver
      p "just created new inquiry with vin #{@inquiry.vin}"
      render 'thankyou'
    else
      render 'new'
    end
	end

  def destroy
    @inquiry = Inquiry.find(params[:id])
    @inquiry.destroy

    redirect_to inquiries_path
  end

  def email_ip
    @inquiry = Inquiry.find(params[:id])
    @inquiry.status = 'Submitted to IP'
    @inquiry.submit_to_ip_date = Time.now
    @inquiry.save
    InquiryMailer.email_ip(@inquiry).deliver
    InquiryMailer.notify_emailed(@inquiry).deliver
    redirect_to @inquiry
  end

  def resolve_no_change
    @inquiry = Inquiry.find(params[:id])
    @inquiry.status = 'Resolved (No IP Change)'
    @inquiry.resolution_date = Time.now
    @inquiry.save
    InquiryMailer.resolved(@inquiry).deliver
    redirect_to @inquiry
  end

  def resolve_ip_change
    @inquiry = Inquiry.find(params[:id])
    @inquiry.status = 'Resolved (IP Change)'
    @inquiry.resolution_date = Time.now
    @inquiry.save
    InquiryMailer.resolved(@inquiry).deliver
    redirect_to @inquiry
  end

  def resolve
    @inquiry = Inquiry.find(params[:id])
    @inquiry.resolution = params[:inquiry][:resolution]
    if @inquiry.status === "Submitted to IP"
      @inquiry.status = 'IP Response Received'
      @inquiry.ip_response_received_date = Time.now
    end 
    if @inquiry.submit_to_ip_date === nil 
      @inquiry.submit_to_ip_date = Time.now 
    end
    @inquiry.save
    flash[:resolved] = "Resolution saved."
    redirect_to @inquiry
  end

  def resolve_deg_response
    @inquiry = Inquiry.find(params[:id])
    @inquiry.status = 'Resolved (DEG Response)'
    @inquiry.resolution_date = Time.now
    @inquiry.save
    InquiryMailer.resolved(@inquiry).deliver 
    redirect_to @inquiry
  end

  def resolve_internal
    @inquiry = Inquiry.find(params[:id])
    @inquiry.status = 'Internal Resolution'
    @inquiry.show_on_web = false 
    @inquiry.save 
    redirect_to @inquiry
  end

  def edit_inquiry
    @inquiry = Inquiry.find(params[:id])
    inquiry_params = params[:inquiry]

    @inquiry.name = inquiry_params[:name]
    @inquiry.title = inquiry_params[:title]
    @inquiry.shop_name = inquiry_params[:shop_name]
    @inquiry.address_1 = inquiry_params[:address_1]
    @inquiry.address_2 = inquiry_params[:address_2]
    @inquiry.city = inquiry_params[:city]
    @inquiry.state = inquiry_params[:state]
    @inquiry.zip_code = inquiry_params[:zip_code]
    @inquiry.phone = inquiry_params[:phone]
    @inquiry.fax = inquiry_params[:fax]
    @inquiry.email = inquiry_params[:email]
    @inquiry.make = inquiry_params[:make]
    @inquiry.make_other_field = inquiry_params[:make_other_field]
    @inquiry.model = inquiry_params[:model]
    @inquiry.year = inquiry_params[:year]
    @inquiry.body_type = inquiry_params[:body_type]
    @inquiry.vin = inquiry_params[:vin]
    @inquiry.database = inquiry_params[:database]
    @inquiry.client_id = inquiry_params[:client_id]
    @inquiry.inquiry_type = inquiry_params[:inquiry_type]
    @inquiry.make_other_field = inquiry_params[:make_other_field]
    @inquiry.missing_area_of_vehicle = inquiry_params[:missing_area_of_vehicle]
    @inquiry.missing_area_of_vehicle_other_field = inquiry_params[:missing_area_of_vehicle_other_field]
    @inquiry.missing_part_name = inquiry_params[:missing_part_name]
    @inquiry.missing_part_description = inquiry_params[:missing_part_description]
    @inquiry.missing_oem_part_number = inquiry_params[:missing_oem_part_number]
    @inquiry.missing_information = inquiry_params[:missing_information]
    @inquiry.missing_issue_summary = inquiry_params[:missing_issue_summary]
    @inquiry.missing_suggested_action = inquiry_params[:missing_suggested_action]
    @inquiry.parts_area_of_vehicle = inquiry_params[:parts_area_of_vehicle]
    @inquiry.parts_area_of_vehicle_other_field = inquiry_params[:parts_area_of_vehicle_other_field]
    @inquiry.parts_part_name = inquiry_params[:parts_part_name]
    @inquiry.parts_part_description = inquiry_params[:parts_part_description]
    @inquiry.parts_oem_part_number = inquiry_params[:parts_oem_part_number]
    @inquiry.parts_issue_summary = inquiry_params[:parts_issue_summary]
    @inquiry.parts_suggested_action = inquiry_params[:parts_suggested_action]
    @inquiry.procedure_area_of_vehicle = inquiry_params[:procedure_area_of_vehicle]
    @inquiry.procedure_area_of_vehicle_other_field = inquiry_params[:procedure_area_of_vehicle_other_field]
    @inquiry.procedure_page_number = inquiry_params[:procedure_page_number]
    @inquiry.procedure_issue_summary = inquiry_params[:procedure_issue_summary]
    @inquiry.procedure_suggested_action = inquiry_params[:procedure_suggested_action]
    @inquiry.welded_area_of_vehicle = inquiry_params[:welded_area_of_vehicle]
    @inquiry.welded_area_of_vehicle_other_field = inquiry_params[:welded_area_of_vehicle_other_field]
    @inquiry.welded_part_name = inquiry_params[:welded_part_name]
    @inquiry.welded_part_number = inquiry_params[:welded_part_number]
    @inquiry.welded_issue_summary = inquiry_params[:welded_issue_summary]
    @inquiry.welded_weld_spots = inquiry_params[:welded_weld_spots]
    @inquiry.welded_materials_involved = inquiry_params[:welded_materials_involved]
    @inquiry.welded_procedure_steps = inquiry_params[:welded_procedure_steps]
    @inquiry.welded_skill_level = inquiry_params[:welded_skill_level]
    @inquiry.welded_complete_time_hour = inquiry_params[:welded_complete_time_hour]
    @inquiry.welded_complete_time_min = inquiry_params[:welded_complete_time_min]
    @inquiry.welded_suggested_action = inquiry_params[:welded_suggested_action]
    @inquiry.non_welded_area_of_vehicle = inquiry_params[:non_welded_area_of_vehicle]
    @inquiry.non_welded_area_of_vehicle_other_field = inquiry_params[:non_welded_area_of_vehicle_other_field]
    @inquiry.non_welded_part_name = inquiry_params[:non_welded_part_name]
    @inquiry.non_welded_part_number = inquiry_params[:non_welded_part_number]
    @inquiry.non_welded_issue_summary = inquiry_params[:non_welded_issue_summary]
    @inquiry.non_welded_procedure_steps = inquiry_params[:non_welded_procedure_steps]
    @inquiry.non_welded_skill_level = inquiry_params[:non_welded_skill_level]
    @inquiry.non_welded_complete_time_hour = inquiry_params[:non_welded_complete_time_hour]
    @inquiry.non_welded_complete_time_min = inquiry_params[:non_welded_complete_time_min]
    @inquiry.non_welded_suggested_action = inquiry_params[:non_welded_suggested_action]
    @inquiry.refinished_area_of_vehicle = inquiry_params[:refinished_area_of_vehicle]
    @inquiry.refinished_area_of_vehicle_other_field = inquiry_params[:refinished_area_of_vehicle_other_field]
    @inquiry.refinished_issue_summary = inquiry_params[:refinished_issue_summary]
    @inquiry.refinished_special_labor = inquiry_params[:refinished_special_labor]
    @inquiry.refinished_surface_area = inquiry_params[:refinished_surface_area]
    @inquiry.refinished_suggested_action = inquiry_params[:refinished_suggested_action]
    @inquiry.all_other_issue_summary = inquiry_params[:all_other_issue_summary]
    @inquiry.all_other_procedure_steps = inquiry_params[:all_other_procedure_steps]
    @inquiry.all_other_complete_time_hour = inquiry_params[:all_other_complete_time_hour]
    @inquiry.all_other_complete_time_min = inquiry_params[:all_other_complete_time_min]
    @inquiry.all_other_suggested_action = inquiry_params[:all_other_suggested_action]
    @inquiry.show_on_web = inquiry_params[:show_on_web]
    @inquiry.old_description = inquiry_params[:old_description]
    @inquiry.short_desc = inquiry_params[:short_desc]

    if !@inquiry.attachment.present?
      @inquiry.attachment = inquiry_params[:attachment]
    end

#     if !@inquiry.attachment2.present?
#       @inquiry.attachment2 = inquiry_params[:attachment2]
#     end

#     if !@inquiry.attachment3.present?
#       @inquiry.attachment3 = inquiry_params[:attachment3]
#     end

#     if !@inquiry.attachment4.present?
#       @inquiry.attachment4 = inquiry_params[:attachment4]
#     end
    
#     if !@inquiry.attachment5.present?
#       @inquiry.attachment5 = inquiry_params[:attachment5]
    end

    if params[:new_resolution_date] != ""
      parsed_date = Date.parse(params[:new_resolution_date]).in_time_zone('EST')
      if parsed_date != @inquiry.resolution_date
        @inquiry.resolution_date = parsed_date
      end
    end

    if (inquiry_params[:completion_days] != "" && @inquiry.resolution_date != nil)
      if inquiry_params[:completion_days] === "0"
        @inquiry.completion_days = 0 
      else  
        completion_days_int = inquiry_params[:completion_days].to_i 
        if completion_days_int != 0 
          @inquiry.completion_days = completion_days_int
        end
      end
    end

    @inquiry.save

    redirect_to @inquiry
  end

  def edit_status
    @inquiry = Inquiry.find(params[:id])

    @inquiry.status = params[:inquiry][:status]
    @inquiry.save

    redirect_to @inquiry
  end

  def find_unresolved_inquiries
    inquiries = Inquiry.new_db.open.not_internal 
    inquiries
  end

  def reporting
    @inquiries = find_unsubmitted_inquiries(params[:database])
    @inquiries = @inquiries.order(sort_column + " " + sort_direction)
    @inquiries = @inquiries.paginate(:per_page => 20, :page => params[:page])

    @unresolved_inquiries = find_unresolved_inquiries
    @unresolved_inquiries = @unresolved_inquiries.order(sort_column + " " + sort_direction)
    @unresolved_inquiries = @unresolved_inquiries.paginate(:per_page => 20, :page => params[:page])

    @report = Report.find(1)
    @export = find_inquiries

    if params[:type] == "Comments" 
      @comments = Comment.where("created_at > ?", 30.days.ago).order(created_at: :desc).paginate(:per_page => 20, :page => params[:page])
    end

    request.format = :csv if params[:csv]

    respond_to do |format|
      format.html
      format.csv { send_data @export.to_csv, filename: 'degweb_export.csv'}
    end

    # render 'reporting'
  end

  def download_errors

    request.format = :csv 

    @errors = Error.all 

    respond_to do |format|
      format.csv { send_data @errors.to_csv, filename: 'errorlog.csv' }
    end
  end


  def weekly_snapshot

    @r = Report.find(1)

    @unresolved_inquiries = find_unresolved_inquiries
    @unresolved_inquiries = @unresolved_inquiries.not_internal.order(sort_column + " " + sort_direction)
    @unresolved_inquiries = @unresolved_inquiries.paginate(:per_page => 10, :page => params[:page])

    @unsubmitted_inquiries = Inquiry.where("created_at < ?", 2.days.ago).where(submit_to_ip_date: nil)
    @unsubmitted_inquiries = @unsubmitted_inquiries.not_internal.order(sort_column + " " + sort_direction)
    @unsubmitted_inquiries = @unsubmitted_inquiries.paginate(:per_page => 10, :page => params[:page])
  end

  def unresolved_list
    @unresolved_inquiries = find_unresolved_inquiries
    @unresolved_inquiries = @unresolved_inquiries.order(sort_column + " " + sort_direction)
    @unresolved_inquiries = @unresolved_inquiries.paginate(:per_page => 10, :page => params[:page])
  end

  def unsubmitted_list
    @unsubmitted_inquiries = Inquiry.where("created_at < ?", 2.days.ago).where(submit_to_ip_date: nil)
    @unsubmitted_inquiries = @unsubmitted_inquiries.order(sort_column + " " + sort_direction)
    @unsubmitted_inquiries = @unsubmitted_inquiries.paginate(:per_page => 10, :page => params[:page])
  end

  def avg_submit_list
    @inquiries = Inquiry.new_db.where(submit_to_ip_date: (Date.today - 30.days)..Date.today)

    if params[:db].present? 
      @inquiries = @inquiries.where(database: params[:db])
    end

    @inquiries = @inquiries.paginate(:per_page => 20, :page => params[:page])

    @r = Report.find(1)
  end

  def avg_resolve_list
    @inquiries = Inquiry.new_db.where(resolution_date: (Date.today - 30.days)..Date.today)

    if params[:db].present? 
      @inquiries = @inquiries.where(database: params[:db])
    end

    @inquiries = @inquiries.paginate(:per_page => 20, :page => params[:page])

    @r = Report.find(1)
  end

  def submitted_inquiries

    new_report = Report.new 

    new_report.num_submitted_all_ccc       = num_submitted("CCC", nil, params[:date_end])
    new_report.num_submitted_year_ccc      = num_submitted("CCC", "Year", params[:date_end])
    new_report.num_submitted_quarter_ccc   = num_submitted("CCC", "Quarter", params[:date_end])
    new_report.num_submitted_month_ccc     = num_submitted("CCC", "Month", params[:date_end])
    new_report.num_submitted_week_ccc      = num_submitted("CCC", "Week", params[:date_end])
    new_report.num_unsubmitted_all_ccc     = num_unsubmitted("CCC", nil, params[:date_end])
    new_report.num_unsubmitted_year_ccc    = num_unsubmitted("CCC", "Year", params[:date_end])
    new_report.num_unsubmitted_quarter_ccc = num_unsubmitted("CCC", "Quarter", params[:date_end])
    new_report.num_unsubmitted_month_ccc   = num_unsubmitted("CCC", "Month", params[:date_end])
    new_report.num_unsubmitted_week_ccc    = num_unsubmitted("CCC", "Week", params[:date_end])

    new_report.num_submitted_all_mitchell       = num_submitted("Mitchell", nil, params[:date_end])
    new_report.num_submitted_year_mitchell      = num_submitted("Mitchell", "Year", params[:date_end])
    new_report.num_submitted_quarter_mitchell   = num_submitted("Mitchell", "Quarter", params[:date_end])
    new_report.num_submitted_month_mitchell     = num_submitted("Mitchell", "Month", params[:date_end])
    new_report.num_submitted_week_mitchell      = num_submitted("Mitchell", "Week", params[:date_end])
    new_report.num_unsubmitted_all_mitchell     = num_unsubmitted("Mitchell", nil, params[:date_end])
    new_report.num_unsubmitted_year_mitchell    = num_unsubmitted("Mitchell", "Year", params[:date_end])
    new_report.num_unsubmitted_quarter_mitchell = num_unsubmitted("Mitchell", "Quarter", params[:date_end])
    new_report.num_unsubmitted_month_mitchell   = num_unsubmitted("Mitchell", "Month", params[:date_end])
    new_report.num_unsubmitted_week_mitchell    = num_unsubmitted("Mitchell", "Week", params[:date_end])

    new_report.num_submitted_all_audatex       = num_submitted("Audatex", nil, params[:date_end])
    new_report.num_submitted_year_audatex      = num_submitted("Audatex", "Year", params[:date_end])
    new_report.num_submitted_quarter_audatex   = num_submitted("Audatex", "Quarter", params[:date_end])
    new_report.num_submitted_month_audatex     = num_submitted("Audatex", "Month", params[:date_end])
    new_report.num_submitted_week_audatex      = num_submitted("Audatex", "Week", params[:date_end])
    new_report.num_unsubmitted_all_audatex     = num_unsubmitted("Audatex", nil, params[:date_end])
    new_report.num_unsubmitted_year_audatex    = num_unsubmitted("Audatex", "Year", params[:date_end])
    new_report.num_unsubmitted_quarter_audatex = num_unsubmitted("Audatex", "Quarter", params[:date_end])
    new_report.num_unsubmitted_month_audatex   = num_unsubmitted("Audatex", "Month", params[:date_end])
    new_report.num_unsubmitted_week_audatex    = num_unsubmitted("Audatex", "Week", params[:date_end])
    
    render :json => new_report

  end

  def submitted_inquiries_datasets
    all_dataset     = Rails.cache.fetch("#{cache_key_for_dataset(params[:date_end])}/all_dataset") do
                        new_inquiries_all(params[:date_end])
                      end 

    quarter_dataset = Rails.cache.fetch("#{cache_key_for_dataset(params[:date_end])}/quarter_dataset") do
                        new_inquiries_quarter(params[:date_end])
                      end
    month_dataset   = Rails.cache.fetch("#{cache_key_for_dataset(params[:date_end])}/month_dataset") do
                        new_inquiries_month(params[:date_end])
                      end

    year_dataset    = Rails.cache.fetch("#{cache_key_for_dataset(params[:date_end])}/year_dataset") do
                        new_inquiries_year(params[:date_end])
                      end

    week_dataset    = Rails.cache.fetch("#{cache_key_for_dataset(params[:date_end])}/week_dataset") do
                        new_inquiries_week(params[:date_end])
                      end

    chart_data = { :all => all_dataset, 
                    :quarter => quarter_dataset,
                    :year => year_dataset,
                    :month => month_dataset,
                    :week => week_dataset }
    render :json => chart_data 
  end

  def response_time 

    report = Report.find(1)

    p "=======start=========\n\n\n\n\n\n"

    avg_response_ccc        = report.avg_response_ccc
    avg_response_audatex    = report.avg_response_audatex
    avg_response_mitchell   = report.avg_response_mitchell

    avg_completion_ccc      = report.avg_completion_ccc                  
    avg_completion_mitchell = report.avg_completion_mitchell
    avg_completion_audatex  = report.avg_completion_audatex   

    p "\n\n\n\n\n\n=======end========="            

    response_data = { :avg_response_ccc     => avg_response_ccc,
                      :avg_response_audatex => avg_response_audatex,
                      :avg_response_mitchell => avg_response_mitchell,
                      :avg_completion_ccc   => avg_completion_ccc,
                      :avg_completion_mitchell => avg_completion_mitchell,
                      :avg_completion_audatex  => avg_completion_audatex }

    render :json => response_data
  end

  def inquiry_counts

    if logged_in? 
      inquiries = Inquiry.all
    else
      inquiries = Inquiry.where(show_on_web: true)
    end

    all_count = inquiries.count
    received_count = inquiries.where(status: 'Received by DEG').count
    submitted_count = inquiries.where(status: 'Submitted to IP').count
    responded_count = inquiries.where(status: 'IP Response Received').count
    ip_change_count = inquiries.where(status: 'Resolved (IP Change)').count 
    no_change_count = inquiries.where(status: 'Resolved (No IP Change)').count 
    deg_response_count = inquiries.where(status: 'Resolved (DEG Response)').count

    count_data = { :all     => all_count,
                    :received   => received_count,
                    :submitted  => submitted_count,
                    :responded  => responded_count,
                    :ip_change  => ip_change_count,
                    :no_change  => no_change_count,
                    :deg_response => deg_response_count }

    render :json => count_data
  end 

  def set_show_on_web
    @inquiry = Inquiry.find(params[:id])
    @inquiry.show_on_web = !@inquiry.show_on_web
    @inquiry.save
    p "setting inquiry to #{@inquiry.show_on_web}"
    render :json => {:show_on_web => @inquiry.show_on_web }
  end

  def thankyoutest
    render 'thankyou'
  end

  def delete_attachment 
    @inquiry = Inquiry.find(params[:id])
    p "\n==========="
    p "hit the delete #{params}"
    p "============\n"

    attach_num = params[:attach_num]

    if attach_num === "a1" 
      @inquiry.attachment = nil 
    elsif attach_num === "a2"
      @inquiry.attachment2 = nil 
    elsif attach_num === "a3"
      @inquiry.attachment3 = nil 
    elsif attach_num === "a4"
      @inquiry.attachment4 = nil 
    elsif attach_num === "a5"
      @inquiry.attachment5 = nil 
    end

    @inquiry.save 
      
    render :json => {:success => true }
  end



	private
	  def inquiry_params
	    params.require(:inquiry).permit(:name, 
                                      :title, 
                                      :shop_name, 
                                      :address_1, 
                                      :address_2, 
                                      :city, 
                                      :state, 
                                      :zip_code, 
                                      :phone, 
                                      :fax, 
                                      :email, 
                                      :make, 
                                      :model, 
                                      :year, 
                                      :body_type, 
                                      :vin, 
                                      :database, 
                                      :client_id, 
                                      :inquiry_type, 
                                      :attachment,
                                      :attachment2,
                                      :attachment3,
                                      :attachment4,
                                      :attachment5, 
                                      :resolution, 
                                      :status, 
                                      :missing_area_of_vehicle,
                                      :missing_area_of_vehicle_other_field,
                                      :missing_part_name,
                                      :missing_part_description,
                                      :missing_oem_part_number,
                                      :missing_information,
                                      :missing_issue_summary,
                                      :missing_suggested_action,
                                      :parts_area_of_vehicle,
                                      :parts_area_of_vehicle_other_field,
                                      :parts_part_name,
                                      :parts_part_description,
                                      :parts_oem_part_number,
                                      :parts_issue_summary,
                                      :parts_suggested_action,
                                      :procedure_area_of_vehicle,
                                      :procedure_area_of_vehicle_other_field,
                                      :procedure_page_number,
                                      :procedure_issue_summary,
                                      :procedure_suggested_action,
                                      :welded_area_of_vehicle,
                                      :welded_area_of_vehicle_other_field,
                                      :welded_issue_summary,
                                      :welded_weld_spots,
                                      :welded_materials_involved,
                                      :welded_part_name,
                                      :welded_part_number,
                                      :welded_procedure_steps,
                                      :welded_skill_level,
                                      :welded_complete_time_hour,
                                      :welded_complete_time_min,
                                      :welded_suggested_action,
                                      :non_welded_area_of_vehicle,
                                      :non_welded_area_of_vehicle_other_field,
                                      :non_welded_part_name,
                                      :non_welded_part_number,
                                      :non_welded_issue_summary,
                                      :non_welded_procedure_steps,
                                      :non_welded_skill_level,
                                      :non_welded_complete_time_hour,
                                      :non_welded_complete_time_min,
                                      :non_welded_suggested_action,
                                      :refinished_area_of_vehicle,
                                      :refinished_area_of_vehicle_other_field,
                                      :refinished_issue_summary,
                                      :refinished_special_labor,
                                      :refinished_surface_area,
                                      :refinished_suggested_action,
                                      :all_other_issue_summary,
                                      :all_other_procedure_steps,
                                      :all_other_complete_time_hour,
                                      :all_other_complete_time_min,
                                      :all_other_suggested_action,
                                      :show_on_web,
                                      :new_resolution_date,
                                      :completion_days,
                                      :old_description,
                                      :short_desc)
	  end

    def sort_column
      if params[:sort] === ""
        return "id"
      end
      params[:sort] || "id"
    end

    def sort_direction
      if params[:direction] === ""
        return "desc"
      end
      params[:direction] || "desc"
    end
end


