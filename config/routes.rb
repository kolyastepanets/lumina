Rails.application.routes.draw do
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
  resources :statistic_likes, only: %i[create update]
  get 'about', to: 'pages#about'
  get 'services', to: 'pages#services'
  get 'code', to: 'pages#code'
end
