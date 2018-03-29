class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :instagram_photos

  def instagram_photos
    response = Instagram.client(access_token: Figaro.env.instagram_access_token)
    photos_count = browser.device.mobile? ? 3 : 9
    @photos = response.user_recent_media(Figaro.env.lumina_instagram_id, count: photos_count)
  end

  def after_sign_in_path_for(_resource)
    admin_albulms_path
  end

  def after_sign_out_path_for(_resource)
    main_app.root_path
  end
end
