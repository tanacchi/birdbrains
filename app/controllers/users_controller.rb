class UsersController < ApplicationController
  before_action :authorize
  
  def show
    @user = current_user
    @all_user = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to users_path
    else
      redirect_to signup_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
