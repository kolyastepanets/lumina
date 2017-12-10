Rails.application.routes.draw do
  get 'articles/index'

  get 'articles/show'

  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'pages#landing'

  resources :categories, only: :index, path: :portfolio
  namespace :blog do
    resources :categories, only: :show
  end
  resources :articles, only: %i[show index], path: 'blog'
  resources :albulms, only: :show
  resources :contact_requests, path: 'contact', only: %i[new create]
  get 'about', to: 'pages#about'
  get 'services', to: 'pages#services'
end
