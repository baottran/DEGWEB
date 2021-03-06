class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @greeting = "Hi"

    @user = user 

    mail to: user.email, subject: "Sign Up Confirmation", bcc: "degweb.info@gmail.com", skip_premailer: true
  end

  def set_password(user)
    @user = user 
    mail to: user.email, subject: "Set DEG Password"
  end
end
