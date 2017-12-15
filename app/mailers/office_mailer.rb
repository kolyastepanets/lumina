class OfficeMailer < ApplicationMailer
  def send_message(mail)
    @body = mail.body
    mail(from: 'Lumina <office@lumina.dp.ua>', to: mail.sent_to, subject: mail.subject)
  end
end
