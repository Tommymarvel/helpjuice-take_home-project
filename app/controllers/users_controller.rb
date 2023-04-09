class UsersController < ApplicationController
  def create
    @user = User.find_or_create_by(user_params)

    session[:user_id] = @user.id
    redirect_to root_path
  end

  def delete_session
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
