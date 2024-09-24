class ApplicationController < ActionController::Base

include CableReady::Broadcaster
helper_method :current_user

  def current_user
    @current_user ||= warden.user(:user) if warden.user(:user)
  end
end
