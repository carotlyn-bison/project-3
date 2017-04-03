class RelationshipsController < ApplicationController
  #relationships controller for follower/following functionality
  #https://www.railstutorial.org/book/following_users
  before_action :require_user
  def show
    @relationship = Relationship.where(:followed_id => params[:id])
  end
  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    redirect_to user_path(@user)
  end
  def destroy
    user = Relationship.find(params[:id]).followed
   current_user.unfollow(user)
   redirect_to user_path(user)
  end
end
