require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET #index' do
    let!(:articles) { create_list(:article, 5) }
    let!(:categories) { create_list(:category_for_blog, 5) }
    let!(:categories_for_portfolio) { create_list(:category_for_portfolio, 5) }

    context 'search articles' do
      let!(:searched_article) { create(:article, description: 'text in new article') }

      before do
        get :index, params: { search: { text: 'text in new article' } }
      end

      it 'assigns @articles' do
        expect(assigns(:articles)).to match_array searched_article
      end

      it 'does not match all articles' do
        expect(assigns(:articles)).to_not match_array articles
      end

      it 'assigns @search_text' do
        expect(assigns(:search_text)).to eq 'text in new article'
      end

      it 'returns template' do
        expect(response).to render_template :search_results
      end
    end

    context 'category articles' do
      let!(:category) { create(:category_for_blog) }
      let!(:article_category) { create(:article) }

      before do
        article_category.categories << category
        get :index, params: { category_slug: category.slug }
      end

      it 'assigns @articles' do
        expect(assigns(:articles)).to match_array article_category
      end

      it 'does not match all articles' do
        expect(assigns(:articles)).to_not match_array articles
      end

      it 'assigns @category' do
        expect(assigns(:category)).to eq category
      end

      it 'returns template' do
        expect(response).to render_template :category_articles
      end
    end

    context 'all articles' do
      before do
        get :index
      end

      it 'assigns @subscriber' do
        expect(assigns(:subscriber)).to be_a_new(Subscriber)
      end

      it 'assigns @categories' do
        expect(assigns(:categories)).to match_array categories
      end

      it 'does not match for categories_for_portfolio' do
        expect(assigns(:categories)).to_not match_array categories_for_portfolio
      end

      it 'assigns @articles' do
        expect(assigns(:articles)).to match_array articles
      end

      it 'returns template' do
        expect(response).to render_template :index
      end
    end
  end

  describe 'GET #show' do
    let!(:article) { create(:article) }

    before do
      get :show, params: { id: article.id }
    end

    it 'assigns @article' do
      expect(assigns(:article)).to eq article
    end

    it 'assigns @comment' do
      expect(assigns(:comment)).to be_a_new(Comment)
    end

    it 'returns template' do
      expect(response).to render_template :show
    end
  end
end
