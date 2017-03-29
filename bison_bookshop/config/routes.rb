Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "books#index"

  get "books/index", to: "books#index" #, as: :books
  get "books/show", to: "books#show", as: :book
  get "books/edit", to: "books#edit", as: :edit_book
  get "books/new", to: "books#new", as: :new_book

  get "reviews/index", to: "reviews#index" #, as: :reviews
  get "reviews/show", to: "reviews#show", as: :review
  get "reviews/edit", to: "reviews#edit", as: :edit_review
  get "reviews/new", to: "reviews#new", as: :new_review

  get "/users/:id", to: "users#show", as: :user # user_path

end
