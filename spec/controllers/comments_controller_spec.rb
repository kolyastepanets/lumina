require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'POST #create' do
    let!(:article) { create(:article) }
    let!(:comment) { build(:comment) }

    context 'success' do
      before do
        post :create, params: { comment: attributes_for(:comment).merge(article_id: article.id) }
      end

      it 'should redirect to article_path' do
        expect(response).to redirect_to(article_path(article.slug))
      end

      it 'should create comment' do
        expect(Comment.count).to eq 1
      end
    end

    context 'fail' do
      before do
        post :create, params: { comment: { article_id: article.id, name: comment.name } }
      end

      it 'should show errors' do
        expect(controller.flash[:error]).to eq I18n.t('errors.format', attribute: 'Email',
                                                                       message: I18n.t('errors.messages.blank'))
      end

      it 'returns to article' do
        expect(response).to redirect_to(article_path(article.slug))
      end
    end
  end
end
