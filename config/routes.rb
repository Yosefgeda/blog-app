Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  root to: 'users#index'
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  # namespace :api do
  #   get '/users/:author_id/posts', to: 'posts#index'
  #   post '/comments', to: 'comments#create'
  #   get '/users/:author_id/posts/:post_id/comments', to: 'comments#index'
  # end

  namespace :api do
    resources :users do
      resources :posts do
        resources :comments
      end
    end
  end

  resources :users do
    resources :posts do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

  get "/users/:user_id/posts/:post_id/comments/new", to: "comments#new", as: 'new_comment'
  post "/users/:user_id/posts/:post_id/comments", to: "comments#create", as: 'comments'
  delete "/users/:user_id/posts/:post_id/comments/:id", to: "comments#destroy", as: 'comment'

end