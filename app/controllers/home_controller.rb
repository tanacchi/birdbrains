# coding: utf-8
class HomeController < ApplicationController  
  def top
    @all_user = User.all
  end

  def signup
    @user = User.new
    render 'users/new'
  end
  
  def signin
  end

  def check_user
    user = User.find_by_name(params[:session][:name])
    if user
      log_in user
      redirect_to users_path, success: "こんにちは、 #{user.name} !"
    else
      redirect_to signin_path, danger: 'サインインに失敗しました。'
    end
  end
  
  def signout
    log_out
    redirect_to root_url, success: 'またね ！'
  end
end
