class OfficeMailer < ApplicationMailer
  def send_message(mail)
    @body = mail.body
    mail(from: 'Lumina <office@lumina.dp.ua>', to: mail.sent_to, subject: mail.subject)
  end

  def notify_on_new_request(request)
    @body = request.body
    @name = request.name
    @email = request.email
    @subject = request.subject
    mail(
      from: 'Lumina <no_reply@lumina.dp.ua>',
      to: Figaro.env.gmail_receiver,
      subject: 'У вас новое сообщение с сайта'
    )
  end
end
