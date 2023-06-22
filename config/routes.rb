Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'users#index'
  resources :users do
    resources :posts
  end
  get "/users/:id/posts/:id/comments/new", to: "comments#new", as: 'new_comment'
  post "/users/:id/posts/:id/comments", to: "comments#create", as: 'comments'
  post "/users/:id/posts/:id", to: "likes#create", as: 'likes'
end
