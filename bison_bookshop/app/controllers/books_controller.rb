class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  respond_to :html, :js
  def index
    if !user_signed_in?
      redirect_to new_user_session_path
    else
    @books = Book.all
    @user = current_user
    end
  end
  def show
    @user = current_user
    @reviews = Review.where(:book_title => @book.title)
    @review = Review.new
    @review.book_id = @book.id
    @review.book_title = @book.title
    @review.user_id = current_user.id
  end
  def edit
  end
  def update
    if @book.update(book_params)
      redirect_back fallback_location: user_path(current_user)
    else
      flash[:alert] = "Book Edit Error!"
    end
  end
  def new
    @book = Book.new
  end
  def edit
  end
def update
   if @book.update(book_params)
    puts "OK"
      redirect_to user_path(current_user.id)
    else
      flash[:alert] = "Book Update error"
  end
end
  def create
    @user = current_user
    @book = Book.new(book_params)
    if @book.save
      puts "OK"
      redirect_to user_path(@user.id)
    else
      flash[:alert] = "Book Creation Error!"
    end
  end
  def destroy
    if @book.destroy
      redirect_to user_path(current_user.id)
    else
      flash[:alert] = "Book Destroy Error!"
    end
  end
  def search
    @response = HTTParty.get('https://www.googleapis.com/books/v1/volumes?q='+params[:title])
    #setting up an AJAX call in the backend.
    render json: {response_data: @response.parsed_response,
                  user_id: current_user.id}
  end
  private
  def set_book
    @book = Book.find(params[:id])
  end
  def book_params
    params.require(:book).permit(:title, :author, :buy_link, :description, :image, :user_id, :book_id, :read)
  end

end
