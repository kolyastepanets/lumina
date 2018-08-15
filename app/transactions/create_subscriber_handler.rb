class CreateSubscriberHandler < BaseHandler
  private

  def handle(transaction)
    id = Rails.application.message_verifier(:unsubscribe).generate(transaction.subscriber.id)
    SubscriberMailer.thank_you(transaction.subscriber, id).deliver_later
    { key: 'success', message: I18n.t('subscriber.subscription_created') }
  end

  def can_handle?(transaction)
    transaction.subscriber[:name] = transaction.subscriber_params[:name]
    transaction.subscriber.save
  end
end
