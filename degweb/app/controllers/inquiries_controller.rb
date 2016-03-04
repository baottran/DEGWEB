class InquiriesController < ApplicationController

	def index
    @inquiries = Inquiry.all
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

  def resolve
    @inquiry = Inquiry.find(params[:id])
    @inquiry.resolution = params[:inquiry][:resolution]
    @inquiry.status = 'IP Response Recieved'
    @inquiry.save

    redirect_to @inquiry
  end

  def edit_customer

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
    @inquiry.save

    redirect_to @inquiry
  end


	private
	  def inquiry_params
	    params.require(:inquiry).permit(:name, :title, :shop_name, :address_1, :address_2, :city, :state, :zip_code, :phone, :fax, :email, :make, :model, :year, :body_type, :vin, :database, :client_id, :inquiry_type, :attachment, :resolution)
	  end
end


