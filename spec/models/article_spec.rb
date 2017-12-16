require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'Association' do
    it { should have_many(:category_articles).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:categories).through(:category_articles).source(:category) }
  end

  context 'Validation' do
    it { should validate_presence_of(:slug) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:main_image) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:small_main_image) }
    it { should validate_presence_of(:preview_description) }
  end

  context 'Scopes' do
    xit 'by_category' do
      category = create(:category_for_portfolio)
      another_category = create(:category_for_portfolio)
      article = create(:article)
      another_article = create(:article)
      article.categories << category
      another_article.categories << another_category

      expect(Article.by_category(category)).to include(article)
      expect(Article.by_category(another_category)).to_not include(another_article)
    end
  end
end
