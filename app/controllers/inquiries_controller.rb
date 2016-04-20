class InquiriesController < ApplicationController

  helper_method :sort_column, :sort_direction

	def index
    @inquiries = find_inquiries
    @inquiries = @inquiries.order(sort_column + " " + sort_direction)
    @inquiries = @inquiries.paginate(:per_page => 20, :page => params[:page])
  end

  def find_inquiries    
    inquiries = Inquiry.all 
    inquiries = inquiries.search(params[:search]) if params[:search].present?
    inquiries = inquiries.where(status: params[:status]) if params[:status].present? 
    inquiries = inquiries.where(database: params[:database]) if params[:database].present?
    inquiries = inquiries.where(inquiry_type: params[:inquiry_type]) if params[:inquiry_type].present?

    if params[:filter_date_type].present? 
      inquiries = inquiries.where("#{params[:filter_date_type]} >= ?", params[:date_start]) if params[:date_start].present?

      # BUG: EQUAL part of less than or equal to doesn't work.

      inquiries = inquiries.where("#{params[:filter_date_type]} <= ?", params[:date_end]) if params[:date_end].present?
    end

    # BUG: area of vehicle search doesn't work. For some reason it can search "Other" but not any other area of vehicle types

    # inquiries = inquiries.where(['area_of_vehicle LIKE ?', params[:area_of_vehicle]]) if params[:area_of_vehicle].present?
    # inquiries = inquiries.where(area_of_vehicle: params[:area_of_vehicle]) if params[:area_of_vehicle].present?
      
    inquiries
  end 


	def show
    @inquiry = Inquiry.find(params[:id])
  end

	def new
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

    if @inquiry.save
      # InquiryMailer.new_inquiry(@inquiry).deliver
      # redirect_to @inquiry
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
    # InquiryMailer.email_ip(@inquiry).deliver

    redirect_to @inquiry
  end

  def resolve_no_change
    @inquiry = Inquiry.find(params[:id])
    @inquiry.status = 'Resolved (No IP Change)'
    @inquiry.resolution_date = Time.now
    @inquiry.save
    redirect_to @inquiry
  end

  def resolve_ip_change
    @inquiry = Inquiry.find(params[:id])
    @inquiry.status = 'Resolved (IP Change)'
    @inquiry.resolution_date = Time.now
    @inquiry.save
    redirect_to @inquiry
  end

  def resolve
    @inquiry = Inquiry.find(params[:id])
    @inquiry.resolution = params[:inquiry][:resolution]
    @inquiry.status = 'IP Response Received'
    @inquiry.ip_response_received_date = Time.now
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
    @inquiry.save

    redirect_to @inquiry
  end

  def edit_status
    @inquiry = Inquiry.find(params[:id])

    @inquiry.status = params[:inquiry][:status]
    @inquiry.save

    redirect_to @inquiry
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
                                      :resolution, 
                                      :status, 
                                      :missing_area_of_vehicle,
                                      :missing_part_name,
                                      :missing_part_description,
                                      :missing_oem_part_number,
                                      :missing_information,
                                      :missing_issue_summary,
                                      :missing_suggested_action,
                                      :parts_area_of_vehicle,
                                      :parts_part_name,
                                      :parts_part_description,
                                      :parts_oem_part_number,
                                      :parts_issue_summary,
                                      :parts_suggested_action,
                                      :procedure_area_of_vehicle,
                                      :procedure_page_number,
                                      :procedure_issue_summary,
                                      :procedure_suggested_action,
                                      :welded_area_of_vehicle,
                                      :welded_area_of_vehicle_other_field,
                                      :welded_part_name,
                                      :welded_part_number,
                                      :welded_procedure_steps,
                                      :welded_skill_level,
                                      :welded_complete_time_hour,
                                      :welded_complete_time_min,
                                      :welded_suggested_action,
                                      :refinished_area_of_vehicle,
                                      :refinished_area_of_vehicle_other_field,
                                      :refinished_issue_summary,
                                      :refinished_special_labor,
                                      :refinished_surface_area,
                                      :refinished_suggested_action,
                                      :all_other_procedure_steps,
                                      :all_other_complete_time_hour,
                                      :all_other_suggested_action)
	  end

    def sort_column
      params[:sort] || "id"
    end

    def sort_direction
      params[:direction] || "asc"
      # %w[asc desc].include?(params[:direction]) ? params[:directon] : "asc"
    end
end


