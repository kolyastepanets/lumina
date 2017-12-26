require 'rails_helper'

RSpec.describe ContactRequestsController, type: :controller do
  describe 'GET #new' do
    before do
      get :new
    end

    it 'assigns contact_request' do
      expect(assigns(:contact_request)).to be_a_new(ContactRequest)
    end

    it 'returns template' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    let!(:contact_request) { build(:contact_request) }

    context 'success' do
      before do
        post :create, params: { contact_request: attributes_for(:contact_request) }
      end

      it 'should redirect to new_contact_request_path' do
        expect(response).to redirect_to(new_contact_request_path)
      end

      it 'should have vacation id' do
        expect(ContactRequest.count).to eq 1
      end
    end

    context 'fail' do
      before do
        post :create, params: { contact_request: { name: '' } }
      end

      it 'should show errors' do
        expect(controller.flash[:error]).to eq I18n.t('contact_request.fail_create')
      end

      it 'returns template' do
        expect(response).to redirect_to(new_contact_request_path)
      end
    end
  end
end
