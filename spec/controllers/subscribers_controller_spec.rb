require 'rails_helper'

RSpec.describe SubscribersController, type: :controller do
  describe 'POST #create' do
    context 'success create' do
      let!(:subscriber) { build(:subscriber) }

      before do
        post :create, params: { subscriber: attributes_for(:subscriber) }
      end

      it 'should redirect to articles_path' do
        expect(response).to redirect_to(articles_path)
      end

      it 'should save subscriber' do
        expect(Subscriber.count).to eq 1
      end
    end

    context 'success update' do
      let!(:subscriber) { create(:subscriber) }

      before do
        post :create, params: { subscriber: { name: 'new name', email: subscriber.email } }
      end

      it 'should redirect to articles_path' do
        expect(response).to redirect_to(articles_path)
      end

      it 'should have new subscriber name' do
        subscriber.reload
        expect(subscriber.name).to eq 'new name'
      end
    end

    context 'fail' do
      before do
        post :create, params: { subscriber: { name: '', email: '' } }
      end

      it 'should show errors' do
        expect(controller.flash[:error]).to eq 'Email can\'t be blank and Name can\'t be blank'
      end

      it 'should redirect to articles_path' do
        expect(response).to redirect_to(articles_path)
      end
    end
  end

  describe 'GET #unsubscribe' do
    let!(:subscriber) { create(:subscriber) }

    context 'success' do
      before do
        @encrypted_id = Rails.application.message_verifier(:unsubscribe).generate(subscriber.id)
        get :unsubscribe, params: { id: @encrypted_id }
      end

      it 'should show success message' do
        expect(controller.flash[:notice]).to eq 'Подписка отменена!'
      end

      it 'should have inactive subscription' do
        subscriber.reload
        expect(subscriber.active).to be_falsey
      end

      it 'redirects to root' do
        expect(response).to redirect_to(root_path)
      end
    end

    context 'fail' do
      before do
        get :unsubscribe, params: { id: 'invalid' }
      end

      it 'should show errors' do
        expect(controller.flash[:error]).to eq 'Не верный запрос'
      end

      it 'redirects to root' do
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
