class CalendarsController < ApplicationController
  before_action :authorize
  def index
  end

  def week
  end

  def custom
  end

  def param
  end

  def meeting
    @meetings = Meeting.all
  end
end
