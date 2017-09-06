class OutOfOfficeController < ApplicationController
	def show
		@status = Status.shared 
		p @status
	end

	def set
	  @status = Status.shared
	 
	  if @status.update(status_params)
	  	flash[:error] = @status.text
	    render 'show'
	  else
	    render 'edit'
	  end
	end

	private
	  def status_params
	    params.require(:status).permit(:text, :activated, :can_create_inquiries)
	  end
end
