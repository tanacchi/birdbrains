class HomeController < ApplicationController
  def top
  end
  
  def signin
    redirect_to root_url
  end

  def signout
    redirect_to root_url
  end
end
