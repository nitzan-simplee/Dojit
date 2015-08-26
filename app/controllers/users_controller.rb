class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    # current_user.avatar = params[:user][:avatar].original_filename
     #raise params[:user][:avatar].original_filename.inspect
      # raise current_user.inspect
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Invalid user information"
      redirect_to edit_user_registration_path
    end
  end
  

  private
  def user_params
    params.require(:user).permit(:name, :avatar, :email_favorites)
  end
end