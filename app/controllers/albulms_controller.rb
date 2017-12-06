class AlbulmsController < ApplicationController
  def show
    @albulm = Albulm.friendly.find(params[:id])
  end
end
