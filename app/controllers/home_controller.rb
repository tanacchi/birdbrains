class HomeController < ApplicationController
  @is_login = false
  def top
  end
  
  def signin
    @is_login = true
    redirect_to :action => 'top', :is_login => true
  end

  def signout
    @is_login = false
    redirect_to :action => 'top', :is_login => false
  end

  def signup
    redirect_to :controller => 'user', :action => 'new'
  end
end
