class SubscriberMailer < ApplicationMailer
  layout 'subscriber_mailer'

  def send_message(mail, subscriber, id)
    @body = mail.body
    @subscriber = subscriber
    @id = id
    mail(from: 'Lumina <no_reply@lumina.dp.ua>', to: @subscriber.email, subject: mail.subject)
  end

  def thank_you(subscriber, id)
    @id = id
    @subscriber = subscriber
    mail(
      from: 'Lumina <no_reply@lumina.dp.ua>',
      to: @subscriber.email,
      subject: I18n.t('subscriber.subscription_created')
    )
  end

  def thank_you_for_renew(subscriber, id)
    @id = id
    @subscriber = subscriber
    mail(
      from: 'Lumina <no_reply@lumina.dp.ua>',
      to: @subscriber.email,
      subject: I18n.t('subscriber.subscription_resumed')
    )
  end
end
