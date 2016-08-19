class SessionsController < ApplicationController
  def new
    render layout: "userpages"
  end

	def create
      user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to inquiries_path
    else
      # Create an error message.
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
	end

	def destroy
    log_out if logged_in?
    redirect_to inquiries_path
  end

end
