class InquiriesController < ApplicationController

	def index
    	@inquiries = Inquiry.all
  	end

	def show
    	@inquiry = Inquiry.find(params[:id])
  	end

	def new
	end

	def create
  		 @inquiry = Inquiry.new(inquiry_params)
 
		 @inquiry.save
		 redirect_to @inquiry
	end

	private
	  def inquiry_params
	    params.require(:inquiry).permit(:title, :text)
	  end

end


