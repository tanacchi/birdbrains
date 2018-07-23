class UsersController < ApplicationController
  before_action :authorize, only: [:show, :edit, :update]
  
  def show
    @user = current_user
    @all_user = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      current_user.notices.create(name: 'Information about user',
                                  message: "You created new account at #{view_context.format_datetime(DateTime.now)}")
      redirect_to users_path, success: "Nice to meet you, #{@user.name}!"
    else
      redirect_to signup_path, danger: 'Failed to create new account.'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      current_user.notices.create(name: 'Information about user',
                                  message: "You edited your profile at #{view_context.format_datetime(DateTime.now)}")      
      redirect_to users_url, success: 'Changes saved successfully.'
    else
      redirect_to edit_users_path, danger: 'Invalid changes exist.'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
