class ContactRequestsController < ApplicationController
  def new
    @contact_request = ContactRequest.new
  end

  def create
    @contact_request = ContactRequest.new(contact_request_params)

    if @contact_request.save
      flash[:success] = 'Спасибо йо! йо! йо!'
      redirect_to new_contact_request_path
    else
      render :new
    end
  end

  private

  def contact_request_params
    params.require(:contact_request).permit(:name, :email, :subject, :body)
  end
end
