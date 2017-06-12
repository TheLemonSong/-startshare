 Rails.application.routes.draw do
  get 'messages/index'

  get 'messages/new'

  get 'messages/create'

  get 'conversations/index'

  get 'conversations/create'

  root to: 'pages#home'
  devise_for :users, controllers: {registrations: "registrations"}
  get '/dashboard', to: 'pages#dashboard'
  get '/messages', to: 'pages#messages'

  resources :projects do
    resources :roles, only: [:new, :create, :edit, :update]
  end

  resources :roles, only: [] do
    resources :applications, only: [:create]
  end
  resources :applications, only: [:show]

  resources :users, only: [:new, :edit, :update, :create, :show, :destroy]

  resources :conversations do
    resources :messages, only: [:create]
  end

  mount Attachinary::Engine => "/attachinary"

end
