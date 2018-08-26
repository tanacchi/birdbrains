# coding: utf-8
class RemindersController < ApplicationController
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
      redirect_to users_reminders_path, success: 'リマインダーが追加されました。'
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
      redirect_to users_reminders_path, success: 'リマインダーが編集されました。'
    else
      render edit_reminder_path(id: @reminder), danger: 'リマインダーの編集に失敗しました。'
    end
  end
  
  private
  def reminder_params
    params.require(:reminder).permit(:name, :user_id)
  end
end
