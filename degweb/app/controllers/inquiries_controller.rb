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
	    params.require(:inquiry).permit(:title, :text)
	  end

end


