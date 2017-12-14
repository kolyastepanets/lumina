class OfficeMailer < ApplicationMailer
  def send_message(mail, user_email)
    @body = mail.body
    mail(from: 'Lumina <office@lumina.dp.ua>', to: user_email, subject: mail.subject)
  end

  def thank_you(subscriber)
    @subscriber_name = subscriber.name
    mail(from: 'Lumina <no_reply@lumina.dp.ua>', to: subscriber.email, subject: 'Спасибо!')
  end

  def thank_you_for_renew(subscriber)
    @subscriber_name = subscriber.name
    mail(
      from: 'Lumina <no_reply@lumina.dp.ua>',
      to: subscriber.email,
      subject: 'Спасибо что возобновили подписку!'
    )
  end
end
