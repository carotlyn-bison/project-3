class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :upvote, :downvote, :destroy]
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
      redirect_to :book
    else
      flash[:alert] = "Review Edit Error!"
    end
  end
  def destroy
    if @review.destroy
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Review Destroy Error!"
    end
  end
  #see routes file for relevance
  #https://github.com/ryanto/acts_as_votable
  #http://www.mattmorgante.com/technology/votable
  def upvote
    @review.upvote_by current_user
    redirect_back fallback_location: :book
  end
  def downvote
    @review.downvote_by current_user
    redirect_back fallback_location: :book
  end
  private
  def set_review
    @review = Review.find(params[:id])
  end
  def review_params
    params.require(:review).permit(:user_id, :out_of_five, :content, :book_id)
  end
end
