Rails.application.routes.draw do
  resources :events
  resources :notifications
  root to: 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match 'user_settings', to: 'users#edit', via: 'get'
end
