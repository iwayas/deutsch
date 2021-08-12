Rails.application.routes.draw do
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  get 'posts/index', to: 'posts#index'
  get 'posts/new', to: 'posts#new'
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get 'home', to: 'homes#index'
  get 'about', to: 'homes#about'
  get "signup", to: "users#new"
  get "users/:id" => "users#show"
  post "users/create" => "users#create"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  resources :users, only: :show
  resources :posts do
    resources :comments, only: :create
  end
end
