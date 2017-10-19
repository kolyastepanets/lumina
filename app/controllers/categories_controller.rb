class CategoriesController < ApplicationController
  def index
    @categories = Category.portfolio
    @albulms = Albulm.all.includes(:category)
  end
end
