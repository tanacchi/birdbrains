class MemosController < ApplicationController
  def show
    @memo = Memo.new
  end

  def new
    @memo = Memo.new
  end
  
  def create
    current_user.memos.create(memo_params)
  end

  private
  def memo_params
    params.require(:memo).permit(:title, :body)
  end
end
