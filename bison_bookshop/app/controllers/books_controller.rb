class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js
  def index
    if !user_signed_in?
      redirect_to new_user_session_path
    else
    @books = Book.all
    @user = current_user.id
    end
  end
  def show
    @review = Review.new
    @review.book_id=@book.id
  end
  def edit
  end
  def update
    if @book.update(book_params)
      redirect_back fallback_location: :root
    else
      redirect_to :book
    end
  end
  def new
    @book = Book.new
  end
  def create
    puts book_params

    @book = Book.new(book_params)
    if @book.save
      puts "OK"
      redirect_back fallback_location: :root
    else
      redirect_to :book
    end
  end
  def destroy
    if @book.destroy
      redirect_to :root
    else
      redirect_back fallback_location: :book
    end
  end
  def search
    @response = HTTParty.get('https://www.googleapis.com/books/v1/volumes?q='+params[:title])
    #setting up an AJAX call in the backend.
    render json: {response_data: @response.parsed_response,
                  user_id: @user}
  end
  private
  def set_book
    @book = Book.find(params[:id])
  end
  def book_params
    params.require(:book).permit(:title, :author, :buy_link, :description, :image, :user_id)
  end
end
