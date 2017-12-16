require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe 'GET #index' do
    let!(:albulms) { create_list(:albulm, 5) }
    let!(:categories_for_blog) { create_list(:category_for_blog, 5) }
    let!(:categories_for_portfolio) { create_list(:category_for_portfolio, 5) }

    before do
      get :index
    end

    it 'assigns @categories' do
      expect(assigns(:categories)).to match_array Category.portfolio
    end

    it 'does not match blog categories' do
      expect(assigns(:categories)).to_not match_array categories_for_blog
    end

    it 'assigns @albulms' do
      expect(assigns(:albulms)).to eq albulms
    end

    it 'returns template' do
      expect(response).to render_template :index
    end
  end
end
