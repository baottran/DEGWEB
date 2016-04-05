# Preview all emails at http://localhost:3000/rails/mailers/inquiry_mailer
class InquiryMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/inquiry_mailer/new_inquiry
  def new_inquiry
    InquiryMailer.new_inquiry
  end

end
