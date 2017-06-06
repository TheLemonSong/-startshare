Rails.application.routes.draw do
  resources :roles, except: [:index]

  devise_for :users
  root to: 'pages#home'
  resources :projects
  resources :users, only: [:new, :edit, :update, :create, :show, :destroy]
  resources :applications, only: [:new, :create, :show]
end
