class InquiryMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inquiry_mailer.new_inquiry.subject
  #
  def new_inquiry(inquiry)
    @inquiry = inquiry
    mail(
      :subject => "DEG - New Inquiry #{@inquiry.id}",
      :to => @inquiry.email, 
      :cc => 'admin@degweb.org, aaron@scrs.com', 
      :bcc => 'bowtran@gmail.com')
  end

  def email_ip(inquiry)
  	@inquiry = inquiry
  	mail(
      :subject => "DEG - Inquiry #{@inquiry.id} Needs Review",
      :to => 'admin@degweb.org', 
      :cc => 'admin@degweb.org', 
      :bcc => 'bowtran@gmail.com')
  end

  # old value is aaron@scrs.com, csherred@cccis.com, sroyston@cccis.com

  def notify_emailed(inquiry)
    @inquiry = inquiry
    mail(
      :subject => "DEG - Inquiry #{@inquiry.id} Emailed to IP",
      :to => @inquiry.email, 
      :cc => 'admin@degweb.org', 
      :bcc => 'bowtran@gmail.com')
  end

  def resolved(inquiry)
    @inquiry = inquiry
    mail(
      :subject => "DEG - Inquiry #{@inquiry.id} Resolved",
      :to => @inquiry.email, 
      :bcc => 'bowtran@gmail.com')
  end

  def resolution_entered(inquiry)
    @inquiry = inquiry
    mail(
      :subject => 'DEG - IP Response Received',
      :to => 'aaron@scrs.com', 
      :cc => 'admin@degweb.org', 
      :bcc => 'bowtran@gmail.com')
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
