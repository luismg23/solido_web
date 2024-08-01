class ApplicationController < ActionController::Base

include CableReady::Broadcaster
helper_method :current_user

  def current_user
    @current_user ||= User.find("1")
    #@current_user ||= warden.user(:user).email
  end
end
