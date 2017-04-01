Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "books#index"

  get "/books", to: "books#index" # books_path  #, as: :books
  get "books/new", to: "books#new", as: :new_book
  get "books/search", to: "books#search", as: :search_books
  get "books/:id", to: "books#show", as: :book
  get "books/:id/edit", to: "books#edit", as: :edit_book
  post "/books", to: "books#create" #no helper bc we're posting


  get "reviews/index", to: "reviews#index" #, as: :reviews
  get "reviews/show", to: "reviews#show", as: :review
  get "reviews/edit", to: "reviews#edit", as: :edit_review
  get "reviews/new", to: "reviews#new", as: :new_review

  delete "/books", to:"books#destroy", as: :delete_book

  get "/users/:id", to: "users#show", as: :user # user_path

   delete "/books/:id", to: "books#destroy"

end
