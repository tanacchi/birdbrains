class HomeController < ApplicationController
  def top
  end
  
  def signin
  end

  def check_user
    user = User.find_by(id: params[:session][:id])
    if user
      redirect_to controller: 'users', action: 'show', id: user.id
    else
      flash[:danger] = 'User not found.'
      redirect_to signin_path
    end
  end
  
  def signout
    redirect_to root_url
  end
end
