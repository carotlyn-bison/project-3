class ReviewsController < ApplicationController
    before_action :set_review, only: [:edit, :update, :destroy]


  def new
    #allows us to pre-set the post_id for any new comments that we make
    #preset book id for any new reviews
     @review = Review.new
     @review.book_id = Book.show.id
   end
  def set_comment
     @review = Review.find(params[:id])
   end
 end

  def create
    @review = Review.new(review_params)
    if @review.save
      # refresh the page if the  save is sucessfull
      redirect_to :back
    else


    end
  end

   def update
    if @review.update(review_params)
      redirect_to :book
    else
      render :edit
    end
  end
  def destroy
    if @review.delete
      #refresh the page on successful delete
      redirect_to :back
    end
  end
  private
  def review_params
    params.require(:review).permit(:review, :book_id)
  end
  def set_comment
    @review = Review.find(params[:id])
  end
end

