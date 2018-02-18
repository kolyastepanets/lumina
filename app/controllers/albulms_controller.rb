class AlbulmsController < ApplicationController
  def show
    @albulm = Albulm.friendly.find(params[:id])
    @albulms = @albulm.category.albulms
  end
end
