class UsersController < ApplicationController
  def show
      if !user_signed_in?
        redirect_to new_user_session_path
      else
        @user = User.find(params[:id])
      end
  end

end
