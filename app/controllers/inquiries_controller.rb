class InquiriesController < ApplicationController

  helper_method :sort_column, :sort_direction

	def index

    noipchanged = Inquiry.where(status: "Resolved (No IP Change)")
    ipchanged = Inquiry.where(status: "Resolved (IP Change)")

    @resolved_inquiries = noipchanged + ipchanged

    if params[:status] === nil
      @inquiries = Inquiry.all.order(sort_column + " " + sort_direction)
    else
      @inquiries = Inquiry.where(status: params[:status]).order(sort_column + " " + sort_direction)
    end



    @search = Search.new

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
      InquiryMailer.new_inquiry(@inquiry).deliver
      redirect_to @inquiry
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

    @inquiry.name       = params[:inquiry][:name]
    @inquiry.title      = params[:inquiry][:title]
    @inquiry.shop_name  = params[:inquiry][:shop_name]
    @inquiry.address_1  = params[:inquiry][:address_1]
    @inquiry.address_2  = params[:inquiry][:address_2]
    @inquiry.city       = params[:inquiry][:city]
    @inquiry.state      = params[:inquiry][:state]
    @inquiry.zip_code   = params[:inquiry][:zip_code]
    @inquiry.phone      = params[:inquiry][:phone]
    @inquiry.fax        = params[:inquiry][:fax]
    @inquiry.email      = params[:inquiry][:email]

    inquiry_params = params[:inquiry]

    @inquiry.make               = inquiry_params[:make]
    @inquiry.make_other_field   = inquiry_params[:make_other_field]
    @inquiry.model              = inquiry_params[:model]
    @inquiry.year               = inquiry_params[:year]
    @inquiry.body_type          = inquiry_params[:body_type]
    @inquiry.vin                = inquiry_params[:vin]

    @inquiry.save

    redirect_to @inquiry
  end

  def edit_vehicle

    @inquiry = Inquiry.find(params[:id])



    redirect_to @inquiry

  end

  def edit_inquiry

    @inquiry = Inquiry.find(params[:id])

    puts '***************************'
    puts params
    puts '***************************'
  end

  def edit_status
    @inquiry = Inquiry.find(params[:id])

    @inquiry.status = params[:inquiry][:status]
    @inquiry.save

    redirect_to @inquiry
  end





	private
	  def inquiry_params
	    params.require(:inquiry).permit(:name, :title, :shop_name, :address_1, :address_2, :city, :state, :zip_code, :phone, :fax, :email, :make, :model, :year, :body_type, :vin, :database, :client_id, :inquiry_type, :attachment, :resolution, :status)
	  end

    def sort_column
      params[:sort] || "id"
    end

    def sort_direction
      params[:direction] || "asc"
      # %w[asc desc].include?(params[:direction]) ? params[:directon] : "asc"
    end


end


