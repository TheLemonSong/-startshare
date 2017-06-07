Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  get '/dashboard', to: 'pages#dashboard'
  resources :projects do
    resources :roles, only: [:new, :create, :edit, :update]
  end
  resources :roles, only: [] do
      resources :applications, only: [:create]
  end
  resources :applications, only: [:show]
end
