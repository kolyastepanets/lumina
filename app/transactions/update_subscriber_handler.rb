class UpdateSubscriberHandler < BaseHandler
  private

  def handle(transaction)
    transaction.subscriber.update(active: true, name: transaction.subscriber_params[:name])
    id = Rails.application.message_verifier(:unsubscribe).generate(transaction.subscriber.id)
    SubscriberMailer.delay.thank_you_for_renew(transaction.subscriber, id)
    { key: 'success', message: I18n.t('subscriber.subscription_resumed') }
  end

  def can_handle?(transaction)
    transaction.subscriber.id?
  end
end
