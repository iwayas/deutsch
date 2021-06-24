Rails.application.routes.draw do
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
end
