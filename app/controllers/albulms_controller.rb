class AlbulmsController < ApplicationController
  def show
    @albulms = Albulm.all
    @albulm = Albulm.friendly.find(params[:id])
  end
end
