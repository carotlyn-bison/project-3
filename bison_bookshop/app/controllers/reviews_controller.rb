class ReviewsController < ApplicationController
<<<<<<< HEAD
  before_action :set_review, only: [:edit, :update, :destroy]
  def index
    @review = Review.all
=======
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  def show
>>>>>>> 1babb26bd744c47f2b447cd519ed0c12f3c6fc9d
  end
  def show
  end

  def new
    @review = Review.new
  end
  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_back fallback_location: :books
      puts "OK"
    else
      flash[:alert] = "Review Creation Error!"
    end
  end
  def edit
  end
  def update
    if @review.update(review_params)
      redirect_to :books
    else
      flash[:alert] = "Review Edit Error!"
    end
  end
  def destroy
    if @review.destroy(review_params)
      redirect_to :books
    else
      flash[:alert] = "Review Destroy Error!"
    end
  end

  private
  def set_review
    @review = Review.find(params[:id])
  end
  def review_params

    params.require(:review).permit(:user_id, :out_of_five, :content, :book_id)
  end
end
