class InquiryMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inquiry_mailer.new_inquiry.subject
  #
  def new_inquiry(inquiry)
    @inquiry = inquiry
    mail(
      :subject => 'DEG - New Inquiry',
      :to => 'aaron@scrs.com', 
      :cc => 'admin@degweb.org', 
      :bcc => 'bowtran@gmail.com, jeff.gosche@sproutdesigns.com, cameron.craig@sproutdesigns.com, jorgecgarciais@gmail.com')
  end

  def email_ip(inquiry)
  	@inquiry = inquiry
  	mail(
      :subject => 'DEG - New Inquiry',
      :to => 'aaron@scrs.com', 
      :cc => 'admin@degweb.org', 
      :bcc => 'bowtran@gmail.com, jeff.gosche@sproutdesigns.com, cameron.craig@sproutdesigns.com, jorgecgarciais@gmail.com')
  end

  def resolved(inquiry)
    @inquiry = inquiry
    mail(
      :subject => 'DEG - Resolved',
      :to => 'aaron@scrs.com', 
      :cc => 'admin@degweb.org', 
      :bcc => 'bowtran@gmail.com, jeff.gosche@sproutdesigns.com, cameron.craig@sproutdesigns.com, jorgecgarciais@gmail.com')
  end

  def resolution_entered(inquiry)
    @inquiry = inquiry
    mail(
      :subject => 'DEG - IP Response Received',
      :to => 'aaron@scrs.com', 
      :cc => 'admin@degweb.org', 
      :bcc => 'bowtran@gmail.com, jeff.gosche@sproutdesigns.com, cameron.craig@sproutdesigns.com, jorgecgarciais@gmail.com')
  end



  def test_message
    mail(
      :subject => 'Hello from Postmark',
      :to  => 'bowtran@gmail.com',
      :from => 'bao.tran@macys.com',
      :html_body => '<strong>Hello</strong> dear Postmark user.',
      :track_opens => 'true')
  end

end
