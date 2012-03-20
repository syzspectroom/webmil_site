class NotificationsMailer < ActionMailer::Base

  default :from => "info@webmil.com.ua"
  default :to => "imsashko@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[YourWebsite.tld] #{message.subject}")
  end

end