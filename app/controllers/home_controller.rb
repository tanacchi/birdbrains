class HomeController < ApplicationController
  @is_login = false
  def top
  end
  
  def signin
    @is_login = true
    redirect_to root_url
  end

  def signout
    @is_login = false
    redirect_to root_url
  end
end
