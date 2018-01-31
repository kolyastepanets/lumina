class PagesController < ApplicationController
  def landing; end

  def about; end

  def services; end

  def code
    render json: Code.last.try(:number)
  end

  def competitor
    render json: Competitor.last.try(:name)
  end
end
