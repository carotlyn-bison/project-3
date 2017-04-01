class ReviewsController < ApplicationController

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

  def create
    @review = Review.new(comment_params)
    if @review.save
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
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:comment_id])
    if @review.destroy
      redirect_to reviews_path @review.book
    else
      render :index
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :review_id)
  end

  def set_review
    @review = Review.find(params[:review_id])
  end

end
