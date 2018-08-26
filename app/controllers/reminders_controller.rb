class RemindersController < ApplicationController
  def index
    @reminders = current_user.reminders
  end

  def show
    @reminder = Reminder.find(params[:id])
  end
end
