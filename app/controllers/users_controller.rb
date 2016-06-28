class UsersController < ApplicationController
  def new
    p "HIHIHIHIHIHIH"
  	@user = User.new 
    render layout: "userpages"
  end

  def show
  	@user = User.find(params[:id])
  end

  def create 
  	@user = User.new(user_params)
  	
  	if @user.save 
      log_in @user 
  		flash[:success] = "Welcome to the Sample App!"
      UserMailer.signup_confirmation(@user).deliver  
  		redirect_to inquiries_path
  	else
      flash[:error] = "Error creating new user. Please try again"
  		render 'new'
  	end

  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
