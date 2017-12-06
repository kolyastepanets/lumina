class CategoriesController < ApplicationController
  def index
    @categories = Category.all.includes(:albulms)
  end
end
