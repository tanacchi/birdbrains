# coding: utf-8
class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  include HomeHelper

  def append_info_to_payload(payload)
    super
    payload[:host]       = request.host
    payload[:ip]         = request.remote_ip
    payload[:login_id]   = session[:login_id]
    payload[:username]   = current_user.try(:name)
    payload[:user_agent] = request.user_agent
    payload[:referer]    = request.referer
  end

  def authorize
    redirect_to signin_path, info: 'サインイン か 新規登録 をしてください。' unless logged_in?
  end
end
