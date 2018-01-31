class StatisticLikesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    statistic_like = StatisticLike.new(statistic_like_params)
    if statistic_like.save
      render json: statistic_like.id
    else
      head :bad_request
    end
  end

  def update
    statistic_like = StatisticLike.find(params['id'])
    if statistic_like.update(statistic_like_params)
      head :ok
    else
      head :bad_request
    end
  end

  private

  def statistic_like_params
    params.permit(:quantity)
  end
end
