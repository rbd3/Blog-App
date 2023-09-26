# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get 'users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  get 'posts/show'
  
  get '/users', to: 'users#index', as: 'users'
  get '/users/:id', to: 'users#show', as: 'user'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #resources :users
end
