class MemosController < ApplicationController
  def show
    @memo = Memo.new
  end
end
