class UsersController < ApplicationController
  include SessionsHelper
   skip_before_action :verify_authenticity_token

  def new
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

  def index 
    if logged_in? 
      @users = User.all 
      @user = User.new
      @ips = InformationProvider.all 
      @new_ip = InformationProvider.new 
      render 'index'
      return
    else 
      redirect_to inquiries_path
    end
  end

  def admin_create_user

    new_user = User.new
    new_user.name = user_params[:name]
    new_user.email = user_params[:email]
    new_user.password = "degwebrailstest"

    if user_params[:isadmin] === "0"
      new_user.isadmin = false 
    else
      new_user.isadmin = true 
    end

    if new_user.save 
      @users = User.all
      @user = User.new 
      UserMailer.set_password(new_user).deliver
      flash[:success] = "Email sent successfully"
      redirect_to action: 'index'
    else
      flash[:error] = "Error creating new user. please try again"
      @users = User.all
      @user = User.new 
      redirect_to action: 'index'
    end
  end

  def password_reset
    email_key = params[:email_key]
    @user = User.where(emailkey: email_key).first

    render 'password_reset'
  end

  def set_password 
    @user = User.find(user_params[:id])
    @user.password = user_params[:password]

    if user_params[:password] != user_params[:password_confirmation]
      flash[:error] = "passwords must match"
      redirect_to :action => "password_reset", :email_key => @user.emailkey 
      return
    end

    if @user.save 
      redirect_to "http://deg.flywheelsites.com/db-admin"
    else 
      flash[:error] = "Error creating new user. Please try again"
      redirect_to :action => "password_reset", :email_key => @user.emailkey 
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to "http://deg.flywheelsites.com/db-admin"
    else
      flash[:error] = "Error creating new user. Please try again"
      redirect_to :action => "password_reset", :email_key => @user.emailkey 
    end
  end

  def edit 
    @user = User.find(params[:id])
  end

  def destroy 
    p "hitting the destroy !!!"
    user = User.find(params[:id])
    user.destroy
    redirect_to :action => 'index'
  end


  private

    def user_params
      params.require(:user).permit(:id, :name, :email, :password,
                                   :password_confirmation, :isadmin)
    end

end
