class InquiryMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inquiry_mailer.new_inquiry.subject
  #
  def new_inquiry(inquiry)
    @inquiry = inquiry
    mail to: inquiry.email
  end

  def email_ip(inquiry)
  	@inquiry = inquiry
  	mail to: 'degweb.info@gmail.com', cc: 'degweb.info@gmail.com'
  end
end
