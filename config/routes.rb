Rails.application.routes.draw do
  get 'messages/index'

  get 'messages/new'

  get 'messages/create'

  get 'conversations/index'

  get 'conversations/create'

  get 'search', to: 'pages#search'

  root to: 'pages#home'
  devise_for :users, controllers: {registrations: "registrations"}
  get '/dashboard', to: 'pages#dashboard'
  get '/messages', to: 'pages#messages'

  resources :projects do
    resources :roles, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :roles, only: [] do
    resources :applications, only: [:create]
  end
  resources :applications, only: [:show]

  resources :users, only: [:new, :edit, :update, :create, :show, :destroy]

  resources :conversations do
    resources :messages, only: [:create]
  end

  get 'applications/:id/accept' => 'applications#accept_application', as: :accept_application
  get 'applications/:id/decline' => 'applications#decline_application', as: :decline_application

  resources :user_skills, only: [:edit, :update, :new, :create, :destroy]

  mount Attachinary::Engine => "/attachinary"

end
