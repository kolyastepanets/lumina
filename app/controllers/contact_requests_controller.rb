class ContactRequestsController < ApplicationController
  def new
    @contact_request = ContactRequest.new
  end

  def create
    @contact_request = ContactRequest.new(contact_request_params)

    if @contact_request.save
      OfficeMailer.delay.notify_on_new_request(@contact_request)
      flash[:success] = I18n.t('contact_request.success_created')
    else
      flash[:error] = I18n.t('contact_request.fail_create')
    end
    redirect_to new_contact_request_path
  end

  private

  def contact_request_params
    params.require(:contact_request).permit(:name, :email, :subject, :body)
  end
end
