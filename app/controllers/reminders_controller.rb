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
      render :new, danger: 'リマインダーの作成に失敗しました。'
    end
  end

  def edit
    @reminder = Reminder.find(params[:id])    
  end
  private
  def reminder_params
    params.require(:reminder).permit(:name, :user_id)
  end
end
