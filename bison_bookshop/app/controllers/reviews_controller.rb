class ReviewsController < ApplicationController
<<<<<<< HEAD

  before_action :set_review, only: [:show, :edit, :update]

  def index
    @book_id = params[:id]
    @book= Book.find(@book_id)
    # @post_comments = Comment.where(post_id: @post_id)
    @book_reviews = @book.reviews
  end

  def new
    @book_id = params[:id]
    @review = Review.new
  end

=======
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action
  def index
    @reviews = Review.all
  end
  def show
  end
  def new
    @review = Review.new
  end
>>>>>>> 3b5334eefbb4eda9cbddccffc00f36a64f6dff07
  def create
    @review = Review.new(comment_params)
    if @review.save
<<<<<<< HEAD
      redirect_to reviews_path(@review.book)
    else
      render :new
    end
  end

  def show
    # @comment = Comment.find(params[:comment_id])
  end

  def edit
    # @comment = Comment.find(params[:comment_id])
    # @post_id = params[:id]
  end

  def update
    # @comment = Comment.find(params[:comment_id])
    if @review.update(review_params)
      redirect_to reviews_path @review.book
=======
      redirect_back fallback_location: :books
    else
      flash[:alert] = "Review Creation Error!"
    end
  end
  def edit
  end
  def update
    if @review.update(review_params)
      redirect_back fallback_location: :books
>>>>>>> 3b5334eefbb4eda9cbddccffc00f36a64f6dff07
    else
      flash[:alert] = "Review Edit Error!"
    end
  end

  def destroy
<<<<<<< HEAD
    @review = Review.find(params[:comment_id])
    if @review.destroy
      redirect_to reviews_path @review.book
    else
      render :index
    end
=======
    if @review.destroy
      redirect_to :books
    else
      flash[:alert] = "Review Destroy Error!"
>>>>>>> 3b5334eefbb4eda9cbddccffc00f36a64f6dff07
  end

  private
<<<<<<< HEAD

  def review_params
    params.require(:review).permit(:description, :review_id)
  end

  def set_review
    @review = Review.find(params[:review_id])
  end

=======
  def set_review
    @review = Review.params[:id]
  end
  def review_params
    params.require(:review).permit(:users_id, :out_of_five, :content, :books_id)
  end
>>>>>>> 3b5334eefbb4eda9cbddccffc00f36a64f6dff07
end
