class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @albulms = Albulm.all.includes(:category)
  end
end
