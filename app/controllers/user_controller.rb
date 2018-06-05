class UserController < ApplicationController
  def show
    # @user = User.find(params[:user_id])
    @user = User.find(1)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
    else
      render 'new'
    end
  end
end
