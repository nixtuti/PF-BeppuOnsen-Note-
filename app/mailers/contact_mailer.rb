class ContactMailer < ApplicationMailer
  
  def contact_mail(contact)
    @contact = contact
    mail to: @contact.user.email, bcc: ENV["ACTION_MAILER_USER"], subject: "お問い合わせについて【自動送信】"
  end
  
end
