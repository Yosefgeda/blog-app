Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'users#index'

  resources :users do
    resources :posts do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

  # Custom routes
  # get "/users/:id/posts/:id/comments/new", to: "comments#new", as: 'new_comment'
  # post "/users/:id/posts/:id/comments", to: "comments#create", as: 'comments'
  # post "/users/:id/posts/:id", to: "likes#create", as: 'likes'
  get "/users/:user_id/posts/:post_id/comments/new", to: "comments#new", as: 'new_comment'
  post "/users/:user_id/posts/:post_id/comments", to: "comments#create", as: 'comments'
  delete "/users/:user_id/posts/:post_id/comments/:id", to: "comments#destroy", as: 'comment'

end