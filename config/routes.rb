Rails.application.routes.draw do
  resources :events
  resources :notifications
  root to: 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match 'members', to: 'users#index', via: 'get'

  match 'user', to: 'users#show', via: 'get'
  match 'user_edit', to: 'users#edit', via: 'get'
end
