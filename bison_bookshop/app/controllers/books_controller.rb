class BooksController < ApplicationController
  def index
    if !user_sign_in?
      redirect_to new_user_session_path
    else
    @books = Book.all #returning a book that is searched
  end
  end

  def show
    @book = Book.find(params[:id]) #individual book and the reviews attached
    @review = Review.new()
    @review.book_id=@book.id
  end

  def edit
  end

  def new
    @book = Book.new()

  end
end
