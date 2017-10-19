class SubscribersController < ApplicationController
  def create
    subscriber = Subscriber.find_or_initialize_by(email: subscriber_params[:email])
    transaction = Transaction.new(subscriber_params, subscriber)
    chain = UpdateSubscriberHandler.new(CreateSubscriberHandler.new(ShowErrorsSubscriberHandler.new))
    result = chain.call(transaction)
    flash[result[:key]] = result[:message]
    redirect_to articles_path
  end

  def unsubscribe
    begin
      id = Rails.application.message_verifier(:unsubscribe).verify(params[:id])
      @subscriber = Subscriber.find(id)

      if @subscriber.update(active: false)
        flash[:notice] = I18n.t('subscriber.subscription_cancelled')
      else
        flash[:alert] = I18n.t('subscriber.fail')
      end
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      flash[:error] = I18n.t('subscriber.fail_cancel')
    end
    redirect_to root_url
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:name, :email)
  end
end
