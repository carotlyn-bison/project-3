class UsersController < ApplicationController
  before_action :set_user, only: [:show, :following, :followers]
  def index
    @users = User.all
  end
  def show
      if !user_signed_in?
        redirect_to new_user_session_path
      else
        @books = Book.where(:user_id => @user.id)
      end
  end
  #following/follower functionality
  #https://www.railstutorial.org/book/following_users
  def following
    @title = "Following"
    @users = @user.following
    render "show_follow"
  end
  def followers
    @title = "Followers"
    @users = @user.followers
    render "show_follow"
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
end
