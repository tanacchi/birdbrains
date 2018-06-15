class ApplicationController < ActionController::Base
  include HomeHelper

  def append_info_to_payload(payload)
    super
    payload[:host]       = request.host
    payload[:ip]         = request.remote_ip
    payload[:login_id]   = session[:login_id]
    payload[:username]   = current_user.try(:username)
    payload[:user_agent] = request.user_agent
    payload[:referer]    = request.referer
  end
end
