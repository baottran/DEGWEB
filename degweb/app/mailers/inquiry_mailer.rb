class InquiryMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inquiry_mailer.new_inquiry.subject
  #
  def new_inquiry
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
