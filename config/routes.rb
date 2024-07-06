Rails.application.routes.draw do
  root "static_pages#home"
  get "/help",       to: "static_pages#help"
  get "/contact",    to: "static_pages#contact"
  get "/policy",     to: "static_pages#policy"
  get "/signup",     to: "users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  get "/post",       to: "microposts#show"

  resources :users
  resources :microposts
end
