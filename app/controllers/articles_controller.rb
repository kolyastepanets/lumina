class ArticlesController < ApplicationController
  def index
    # @grouped_articles = Article.all.group_by do
    #   |art| I18n.l(art.created_at, format: :month_and_year, locale: :ru)
    # end
    if article_params['category_slug'].present?
      @category = Category.find_by(slug: article_params['category_slug'])
      @articles = Article.by_category(@category)
      render 'category_articles'
    else
      @articles = Article.all.includes(%i[category_articles categories])
      @categories = Category.blog
      # @grouped_articles = Article.all.group_by { |art| art.created_at.strftime('%B%Y') }
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
