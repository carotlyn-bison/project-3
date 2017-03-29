Rails.application.routes.draw do
  get 'books/index'

  get 'books/show'

  get 'books/edit'

  get 'books/new'

  get 'reviews/index'

  get 'reviews/show'

  get 'reviews/edit'

  get 'reviews/new'

  get 'users/index'

  get 'users/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

end
