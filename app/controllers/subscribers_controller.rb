class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.find_or_initialize_by(email: subscriber_params[:email])
    @subscriber[:name] = subscriber_params[:name]

    if @subscriber.id?
      @subscriber.update(active: true, name: subscriber_params[:name])
      flash[:success] = 'Спасибо за возобновление подписки!'
      OfficeMailer.delay.thank_you_for_renew(@subscriber)
    elsif @subscriber.save
      flash[:success] = 'Спасибо за подписку!'
      OfficeMailer.delay.thank_you(@subscriber)
    else
      flash[:error] = @subscriber.errors.full_messages.to_sentence
    end
    redirect_to articles_path
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:name, :email)
  end
end
