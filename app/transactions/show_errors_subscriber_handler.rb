class ShowErrorsSubscriberHandler < BaseHandler
  private

  def handle(transaction)
    { key: 'error', message: transaction.subscriber.errors.full_messages.to_sentence }
  end

  def can_handle?(_transaction)
    true
  end
end
