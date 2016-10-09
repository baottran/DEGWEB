class InformationProvidersController < ApplicationController
	def destroy 
    ip = InformationProvider.find(params[:id])
    ip.destroy
    redirect_to :controller => 'users', :action => 'index'
  end

  def create 
  	p "-======"
  	p ip_params
   	@ipnew = InformationProvider.new(ip_params)
   	if @ipnew.save 
   		p "successfully created new ip"
   		flash[:ip_success] = "Successfully added new IP"
   	else 
   		p "ip error"
   		flash[:ip_error] = "Error saving IP, please try again"
   	end
  	redirect_to :controller => 'users', :action => 'index'
  end

  private

    def ip_params
      params.require(:information_provider).permit(:id, :name, :email, :platform)
    end
end
