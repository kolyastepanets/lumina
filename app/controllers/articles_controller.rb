class ArticlesController < ApplicationController
  before_action :load_categories
  before_action :init_subscriber

  def index
    if article_params['category_slug'].present?
      category_articles
    elsif article_params['search'].present?
      search_results
    else
      @articles = Article.all.order('created_at DESC').includes(%i[category_articles categories])
      # binding.pry
    end
  end

  def show
    @article = Article.friendly.find(params[:id])
    @comment = Comment.new
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

  def load_categories
    @categories = Category.blog
  end

  def init_subscriber
    @subscriber = Subscriber.new
  end

  def article_params
    params.permit(:id, :category_slug, search: [:text])
  end
end
