class InquiryMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inquiry_mailer.new_inquiry.subject
  #

  @prod = true 

  def new_inquiry(inquiry)
    @inquiry = inquiry
      mail(
        :subject => "DEG - New Inquiry #{@inquiry.id}",
        :to => @inquiry.email, 
        :cc => 'admin@degweb.org, aaron@scrs.com', 
        :bcc => 'bowtran@gmail.com')
  end

  # 

  def email_ip(inquiry)
  	@inquiry = inquiry
    	mail(
        :subject => "DEG - Inquiry #{@inquiry.id} Needs Review",
        :to => InformationProvider.email_list_for(@inquiry.database), 
        :cc => 'admin@degweb.org')
  end


  def notify_emailed(inquiry)
    @inquiry = inquiry
    mail(
      :subject => "DEG - Inquiry #{@inquiry.id} Emailed to IP",
      :to => @inquiry.email, 
      :cc => 'admin@degweb.org')
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

  def weekly_report 
    mail(
      :subject => "DEG Weekly Snapshot",
      :to => 'bowtran@gmail.com')
  end

end
