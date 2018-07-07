class NoticesController < ApplicationController
  def create
  end

  def mark_as_read
    notice = Notice.find(params[:id])
    notice.has_read = true
    notice.save!
    redirect_back fallback_location: root_path
  end
  
  def destroy
  end
end
