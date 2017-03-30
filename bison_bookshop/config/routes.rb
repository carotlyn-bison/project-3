Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "books#index"

  get "books/index", to: "books#index"
  get "books/:id", to: "books#show"
  get "books/edit", to: "books#edit"
  get "books/new", to: "books#new"

  get "reviews/index", to: "reviews#index"
  get "reviews/:id", to: "reviews#show"
  get "reviews/edit", to: "reviews#edit"
  get "reviews/new", to: "reviews#new"

  get "/users/:id", to: "users#show", as: :user # user_path

end
