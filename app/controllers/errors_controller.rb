class ErrorsController < ApplicationController
 
  def not_found
  	p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n\n"
  	p "not found hit yo homie"
  	p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n\n"
    render 'error'
  end
 
  def unacceptable
    render :status => 422
  end
 
  def internal_error
    render :status => 500
  end
 
end
