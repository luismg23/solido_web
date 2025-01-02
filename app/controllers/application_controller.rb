class ApplicationController < ActionController::Base
  include CableReady::Broadcaster

  before_action :current_user, :current_profile
  before_action :authenticate_user!
  helper_method :current_user
  helper_method :current_profile

  def current_user
    @current_user ||= warden.user(:user) if warden.user(:user)
  end

  def current_profile
    @current_profile ||= Profile.find_by(email: current_user.email) if current_user
  end
end
