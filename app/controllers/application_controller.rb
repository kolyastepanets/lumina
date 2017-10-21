class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :instagram_photos

  def instagram_photos
    response = Instagram.client(access_token: Figaro.env.instagram_access_token)
    @photos ||= response.user_recent_media(Figaro.env.lumina_instagram_id, count: 8)
  end
end
