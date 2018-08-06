# coding: utf-8
class MemosController < ApplicationController
  before_action :authorize,  only: [:show, :edit, :create, :update, :destroy]
  before_action :correct_user, only: [:destroy]
  
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
    @memo = current_user.memos.build(memo_params)
    if @memo.save
      current_user.notices.create(name: 'メモに関する通知',
                                  message: "メモ「#{@memo.title}」が追加されました。")
      redirect_to users_memos_path(id: @memo), success: 'メモが追加されました。'
    else
      redirect_to new_users_memos_path, danger: 'メモの追加に失敗ました。'
    end
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    @memo = Memo.find(params[:id])
    if @memo.update_attributes(memo_params)
      current_user.notices.create(name: 'メモに関する通知',
                                  message: "メモ「#{@memo.title}」が編集されました。")      
      redirect_to users_memos_path(id: @memo), success: 'メモの情報が更新されました。'
    else
      redirect_to edit_users_memos_path(id: @memo), danger: 'メモの更新に失敗しました。'
    end
  end

  def destroy
    @memo.destroy
    current_user.notices.create(name: 'メモに関する通知',
                                message: "メモ「#{@memo.title}」が削除されました。")
    redirect_to users_url, success: 'メモを削除しました。'
  end
  
  private
  def memo_params
    params.require(:memo).permit(:title, :body)
  end

  def correct_user
    @memo = current_user.memos.find_by(id: params[:id])
    if @memo.nil?
      redirect_to root_url, warning: '不正なアクセスです。'
    end
  end
end
