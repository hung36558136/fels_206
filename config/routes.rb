Rails.application.routes.draw do
  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
<<<<<<< HEAD
  get "/words", to: "users#words"
=======

>>>>>>> 38e620cc09f65e1a53816e1998308118cf0f59c9
  resources :users
  resources :categories

  namespace :admin do
    resources :categories
    resources :users
  end
end
