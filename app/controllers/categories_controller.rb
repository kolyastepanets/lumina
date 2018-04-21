class CategoriesController < ApplicationController
  def index
    @categories = Category.portfolio
    @albulms = Albulm.all.includes(:category_albulms, :categories).order(created_at: :asc)
  end
end
