Rails.application.routes.draw do
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'pages#landing'

  resources :categories, only: :index, path: :portfolio
  resources :albulms, only: :show
  resources :contact_requests, path: 'contact', only: %i[new create]
  get 'about', to: 'pages#about'
  get 'services', to: 'pages#services'
end
