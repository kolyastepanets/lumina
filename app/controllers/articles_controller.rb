class ArticlesController < ApplicationController
  def index
    if article_params['category_slug'].present?
      @category = Category.find_by(slug: article_params['category_slug'])
      @articles = Article.by_category(@category)
      render 'category_articles'
    else
      @articles = Article.all.includes(%i[category_articles categories])
      @categories = Category.blog
    end
  end

  def show
    @article = Article.friendly.find(params[:id])
  end

  private

  def article_params
    params.permit(:id, :category_slug)
  end
end
