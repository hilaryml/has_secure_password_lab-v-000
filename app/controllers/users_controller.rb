class UsersController < ApplicationController
  before_action :require_login

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to new_user_path, alert: "Invalid."
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
