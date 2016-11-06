Rails.application.routes.draw do
  root 'dictionaries#index'

  resources :words
  resources :dictionaries
  resources :users

  resources :user_sessions, only: [:create, :destroy]
  get 'users/confirm_email/:token', to: 'users#confirm_email', as: :confirm_email
  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
  get '/sign_in', to: 'user_sessions#new', as: :sign_in

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
