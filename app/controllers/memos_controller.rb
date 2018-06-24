class MemosController < ApplicationController
  before_action :authorize,  only: [:show, :edit]
  
  def index
    @all_memos = Memo.all
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def new
    @memo = Memo.new
  end
  
  def create
    @memo = current_user.memos.create!(memo_params)
    if @memo
      redirect_to action: 'show', id: @memo.id
    else
      redirect_to new_users_memos_path
    end
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    @memo = Memo.find(params[:id])
    if @memo.update_attributes(memo_params)
      redirect_to action: 'show', id: @memo.id
    else
      redirect_back
    end
  end
  
  private
  def memo_params
    params.require(:memo).permit(:title, :body)
  end
end
