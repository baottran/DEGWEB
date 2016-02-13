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

	private
	  def inquiry_params
	    params.require(:inquiry).permit(:name, :title, :shop_name, :address_1, :address_2, :city, :state, :zip_code, :phone, :fax, :email, :make, :model, :year, :body_type, :vin, :database, :client_id, :inquiry_type)
	  end
end


