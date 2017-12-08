Rails.application.routes.draw do
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'pages#landing'

  resources :categories, only: :index, path: :portfolio
  resources :albulms, only: :show
end
