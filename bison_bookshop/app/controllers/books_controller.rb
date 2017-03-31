
class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :update, :destroy]
  respond_to :html, :js
  def index
    if !user_signed_in?
      redirect_to new_user_session_path
    else
    @books = Book.all
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
    @book = Book.new(book_params)
    if @book.save
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
<<<<<<< HEAD
    @resp = HTTParty.get(GoogleBooks.search(params[:title]))
=======
    @response = HTTParty.get('https://www.googleapis.com/books/v1/volumes?q='+params[:title])
>>>>>>> 2752dc90826bd4faeda3684eaec69369a61ff4b8
    #setting up an AJAX call in the backend.
    render json: @response.parsed_response
    # respond_to do |format|
    #     format.html {render search}
    #     format.json #{render json: @resp, content_type: 'text/json'}
    #     format.js
    # end
  end
  private
  def set_book
    @book = Book.find(params[:title])
  end
  def book_params
    params.require(:book).permit(:title, :author, :buy_link, :description, :image, :user_id)
  end
end
