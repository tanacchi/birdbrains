class MemosController < ApplicationController
  def show
    @memo = Memo.new
    @all_memos = Memo.all
  end

  def new
    @memo = Memo.new
  end
  
  def create
    if current_user.memos.create!(memo_params)
      redirect_to memos_path
    else
      redirect_to mwmos_new_path
    end
  end

  private
  def memo_params
    params.require(:memo).permit(:title, :body)
  end
end
