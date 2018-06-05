class HomeController < ApplicationController
  @is_login = false
  def top
  end
  
  def signin
    @is_login = true
    redirect_to :action => 'top', :is_login => true
  end
end
