Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'

  resources :users do
    resources :posts do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end

  # Custom routes
  # get "/users/:id/posts/:id/comments/new", to: "comments#new", as: 'new_comment'
  # post "/users/:id/posts/:id/comments", to: "comments#create", as: 'comments'
  # post "/users/:id/posts/:id", to: "likes#create", as: 'likes'
end