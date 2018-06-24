class HomeController < ApplicationController  
  def top
    @all_user = User.all
  end

  def signup
    @user = User.new
  end
  
  def signin
  end

  def check_user
    user = User.find_by_name(params[:session][:name])
    if user
      log_in user
      redirect_to users_path
    else
      flash[:danger] = 'User not found.'
      redirect_to signin_path
    end
  end
  
  def signout
    log_out
    redirect_to root_url
  end
end
