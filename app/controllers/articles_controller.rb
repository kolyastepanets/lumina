class ArticlesController < ApplicationController
  def index
    if article_params['category_slug'].present?
      category_articles
    elsif article_params['search'].present?
      search_results
    else
      @categories = Category.blog
      @articles = Article.all.includes(%i[category_articles categories])
    end
  end

  def show
    @article = Article.friendly.find(params[:id])
  end

  private

  def category_articles
    @category = Category.find_by(slug: article_params['category_slug'])
    @articles = Article.by_category(@category)
    render 'category_articles'
  end

  def search_results
    @search_text = article_params['search']['text']
    @articles = Article.search_in_articles(article_params['search']['text'])
    render 'search_results'
  end

  def article_params
    params.permit(:id, :category_slug, search: [:text])
  end
end
