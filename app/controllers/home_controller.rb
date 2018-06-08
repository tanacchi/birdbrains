class HomeController < ApplicationController
  def top
  end
  
  def signin
  end

  def check_user
    user = User.find_by_id(params[:session][:id])
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
