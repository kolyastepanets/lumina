require 'rails_helper'

RSpec.describe AlbulmsController, type: :controller do
  describe 'GET #show' do
    let!(:albulm) { create(:albulm) }
    let!(:albulms) { Albulm.all }

    before do
      get :show, params: { id: albulm.id }
    end

    it 'assigns @albulm' do
      expect(assigns(:albulm)).to eq albulm
    end

    it 'assigns @albulms' do
      expect(assigns(:albulms)).to eq albulms
    end

    it 'returns template' do
      expect(response).to render_template :show
    end
  end
end
