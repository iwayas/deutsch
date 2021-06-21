Rails.application.routes.draw do
  get 'home', to: 'homes#index'
  get "signup", to: "users#new"
  get "users/:id" => "users#show"
end
