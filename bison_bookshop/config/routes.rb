Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "books#index"

  get "/books", to: "books#index" # books_path  #, as: :books
  get "books/new", to: "books#new", as: :new_book
  get "books/search", to: "books#search", as: :search_books
  get "books/:id", to: "books#show", as: :book
  post "/books", to: "books#create" #no helper bc we're posting
  delete "/books/:id", to: "books#destroy" #no helper bc we're deleting

<<<<<<< HEAD

  get "reviews/index", to: "reviews#index" #, as: :reviews
  get "reviews/edit", to: "reviews#edit", as: :edit_review
  get "reviews/new", to: "reviews#new", as: :new_review
  post "reviews", to: "reviews#create" #no helper bc we're posting


  delete "reviews/:id", to: "reviews#destroy", as: :delete_review
=======
  get "reviews/new", to: "reviews#new", as: :new_review
  get "reviews/:id", to: "reviews#show", as: :review
  get "reviews/:id/edit", to: "reviews#edit", as: :edit_review
  post "/reviews", to: "reviews#create" #no helper bc we're posting
  patch "/reviews/:id", to: "reviews#update" #no helper bc we're patching
  delete "/reviews/:id", to: "reviews#destroy" #no helper bc we're deleting
>>>>>>> 1babb26bd744c47f2b447cd519ed0c12f3c6fc9d

  get "/users/:id", to: "users#show", as: :user # user_path



end
