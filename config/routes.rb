Rails.application.routes.draw do
  get 'articles/index'

  get 'articles/show'

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
  resources :contact_requests, path: 'contact', only: %i[new create]
  get 'about', to: 'pages#about'
  get 'services', to: 'pages#services'
end
