# coding: utf-8
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
      redirect_to users_path, success: "#{@user.name}さん、 はじめまして!"
    else
      redirect_to signup_path, danger: '新規登録に失敗しました。'
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
      redirect_to users_url, success: 'ユーザー情報が更新されました。'
    else
      redirect_to edit_users_path, danger: '更新に失敗しました。'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
