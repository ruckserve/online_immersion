Rails.application.routes.draw do

  # Home
  root 'home#index'

  # ReSTful user and chatrooms routes
  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :chatrooms, except: [:edit, :update]
  end

  get '/users/:user_id/chatrooms/:id/views/:view', to: 'chatrooms#angular_view'

  # Login/logout through OAUTH
  get '/:provider/login',         to: 'sessions#new',     as: :login
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure',            to: 'sessions#failure'
  get '/logout',                  to: 'sessions#destroy', as: :logout

  # Admin controls for banning users and such
  # namespace :admin do
  #   resources :users
  # end
end
