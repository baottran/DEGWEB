class InquiryMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inquiry_mailer.new_inquiry.subject
  #

  @prod = true 

  def new_inquiry(inquiry)
    @inquiry = inquiry
    if @prod 
      mail(
        :subject => "DEG - New Inquiry #{@inquiry.id}",
        :to => @inquiry.email, 
        :cc => 'admin@degweb.org, aaron@scrs.com', 
        :bcc => 'bowtran@gmail.com')
    end
  end

  # 

  def email_ip(inquiry)
  	@inquiry = inquiry
    if @prod 
    	mail(
        :subject => "DEG - Inquiry #{@inquiry.id} Needs Review",
        :to => 'aaron@scrs.com', 
        :cc => 'admin@degweb.org', 
        :bcc => 'bowtran@gmail.com')
    end
  end


  def notify_emailed(inquiry)
    @inquiry = inquiry
    if @prod 
    mail(
      :subject => "DEG - Inquiry #{@inquiry.id} Emailed to IP",
      :to => @inquiry.email, 
      :cc => 'admin@degweb.org', 
      :bcc => 'bowtran@gmail.com')
   end
  end

  def resolved(inquiry)
    @inquiry = inquiry
    if @prod 
    mail(
      :subject => "DEG - Inquiry #{@inquiry.id} Resolved",
      :to => @inquiry.email, 
      :bcc => 'bowtran@gmail.com')
    end
  end

  def resolution_entered(inquiry)
    @inquiry = inquiry
    if @prod 
      mail(
        :subject => 'DEG - IP Response Received',
        :to => 'aaron@scrs.com', 
        :cc => 'admin@degweb.org', 
        :bcc => 'bowtran@gmail.com')
    end
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
