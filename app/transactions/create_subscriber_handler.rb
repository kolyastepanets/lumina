class CreateSubscriberHandler < BaseHandler
  private

  def handle(transaction)
    id = Rails.application.message_verifier(:unsubscribe).generate(transaction.subscriber.id)
    SubscriberMailer.delay.thank_you(@subscriber, id)
    { key: 'success', message: 'Спасибо за подписку!' }
  end

  def can_handle?(transaction)
    transaction.subscriber[:name] = transaction.subscriber_params[:name]
    transaction.subscriber.save
  end
end
