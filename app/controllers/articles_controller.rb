class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @categories = Category.blog
    @grouped_articles = Article.all.group_by { |art| art.created_at.strftime('%B%Y') }
    # @grouped_articles = Article.all.group_by do
    #   |art| I18n.l(art.created_at, format: :month_and_year, locale: :ru)
    # end
  end

  def show
    @article = Article.friendly.find(params[:id])
  end
end
