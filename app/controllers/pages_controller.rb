class PagesController < ApplicationController
  def landing; end

  def about; end

  def services; end

  def code
    render json: Code.first.try(:number)
  end
end
