ActiveAdmin.setup do |config|
  config.site_title = "Lumina"
  config.default_namespace = :admin
  config.authentication_method = :authenticate_admin!
  config.current_user_method = :current_admin
  config.logout_link_path = :destroy_admin_session_path
  config.batch_actions = true
  config.localize_format = :long
  config.comments = false
  config.root_to = 'admin/albulms#index'
end
