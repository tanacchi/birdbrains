# coding: utf-8
class RemindersController < ApplicationController
  before_action :correct_user, only: [:destroy]
  
  def index
    @reminders = current_user.reminders
  end

  def show
    @reminder = Reminder.find(params[:id])
  end

  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = current_user.reminders.build(reminder_params)
    if @reminder.save
      current_user.notices.create(name: 'リマインダーに関する通知',
                                    message: "リマインダー「#{@reminder.name}」が追加されました。")
      redirect_to reminder_path(id: @reminder), success: 'リマインダーが追加されました。'
    else
      render new_users_reminders_path, danger: 'リマインダーの作成に失敗しました。'
    end
  end

  def edit
    @reminder = Reminder.find(params[:id])    
  end

  def update
    @reminder = Reminder.find(params[:id])
    if @reminder.update_attributes(reminder_params)
      current_user.notices.create(name: 'リマインダーに関する通知',
                                    message: "リマインダー「#{@reminder.name}」が編集されました。")
      redirect_to reminder_path(id: @reminder), success: 'リマインダーが編集されました。'
    else
      render edit_reminder_path(id: @reminder), danger: 'リマインダーの編集に失敗しました。'
    end
  end

  def destroy
    @reminder.destroy
    current_user.notices.create(name: 'リマインダーに関する通知',
                                  message: "リマインダー「#{@reminder.name}」が削除されました。")
    redirect_to users_reminders_path, success: 'リマインダーを削除しました。'
  end
  
  private
  def reminder_params
    params.require(:reminder).permit(:name, :user_id)
  end

  def correct_user
    @reminder = current_user.reminders.find_by(id: params[:id])
    if @reminder.nil?
      redirect_to root_url, warning: '不正なアクセスです。'
    end
  end
end
