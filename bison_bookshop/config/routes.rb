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
  patch "/books/:id", to: "books#update"
  delete "/books/:id", to: "books#destroy" #no helper bc we're deleting

  get "reviews/new", to: "reviews#new", as: :new_review
  get "reviews/:id", to: "reviews#show", as: :review
  get "reviews/:id/edit", to: "reviews#edit", as: :edit_review
  post "/reviews", to: "reviews#create" #no helper bc we're posting
  patch "/reviews/:id", to: "reviews#update" #no helper bc we're patching
  #upvote/downvote routes
  #https://github.com/ryanto/acts_as_votable
  #http://www.mattmorgante.com/technology/votable
  patch "like/:id", to: "reviews#upvote", as: :like
  patch "dislike/:id", to: "reviews#downvote", as: :dislike
  delete "/reviews/:id", to: "reviews#destroy" #no helper bc we're deleting

  get "/users/:id", to: "users#show", as: :user # user_path
  #followers/following routes
  #https://www.railstutorial.org/book/following_users
  get "/users/:id/followers", to: "users#followers", as: :following_user
  get "/users/:id/following", to: "users#following", as: :follows_user

  get "/relationships/:id", to: "relationships#show", as: :relationship
  post "/relationships", to: "relationships#create"
  delete "/relationships/:id", to: "relationships#destroy"
end
