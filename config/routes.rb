Rails.application.routes.draw do
  resources :roles, except: [:index]

  devise_for :users
  root to: 'pages#home'
  resources :projects
  resources :users, only: [:new, :edit, :update, :create, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
