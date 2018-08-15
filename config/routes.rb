require 'sidekiq/web'
require 'sidekiq/cron/web'

Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  ActiveSupport::SecurityUtils.secure_compare(
    ::Digest::SHA256.hexdigest(username),
    ::Digest::SHA256.hexdigest(ENV.fetch('ADMIN_NAME'))
  ) & ActiveSupport::SecurityUtils.secure_compare(
    ::Digest::SHA256.hexdigest(password),
    ::Digest::SHA256.hexdigest(ENV.fetch('ADMIN_PASSWORD'))
  )
end

Rails.application.routes.draw do
  mount Sidekiq::Web, at: '/sidekiq'
  default_url_options host: Rails.application.config.domain
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'pages#landing'

  resources :categories, only: :index, path: :portfolio
  resources :articles, only: %i[show index], path: 'blog' do
    collection do
      get 'category/:category_slug', action: :index, as: 'category'
    end
  end
  resources :albulms, only: :show
  resources :comments, only: :create
  resources :subscribers, only: :create do
    member do
      get :unsubscribe
    end
  end
  resources :contact_requests, path: 'contact', only: %i[new create]
  get 'about', to: 'pages#about'
  get 'services', to: 'pages#services'
  get 'code', to: 'pages#code'
  get 'competitor', to: 'pages#competitor'
end
