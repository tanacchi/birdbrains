class MemosController < ApplicationController
  def show
    @memo = Memo.new
  end

  def new
    current_user.memos.create(made_time: DateTime.now)
  end
  
  def create
  end
end
