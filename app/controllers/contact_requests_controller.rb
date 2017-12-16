class ContactRequestsController < ApplicationController
  def new
    @contact_request = ContactRequest.new
  end

  def create
    @contact_request = ContactRequest.new(contact_request_params)

    if @contact_request.save
      flash[:success] = 'Спасибо за сообщение!'
    else
      flash[:error] = 'Заполните все поля пожалуйста'
    end
    redirect_to new_contact_request_path
  end

  private

  def contact_request_params
    params.require(:contact_request).permit(:name, :email, :subject, :body)
  end
end
