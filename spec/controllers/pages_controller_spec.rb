require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  %i[landing about services].each do |page|
    describe "GET ##{page}" do
      before do
        get page
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'returns template' do
        expect(response).to render_template page
      end
    end
  end
end
