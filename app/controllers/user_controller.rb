class UserController < ApplicationController
  def show
    # @user = User.find(params[:user_id])
    @user = User.find(1)
  end
end
