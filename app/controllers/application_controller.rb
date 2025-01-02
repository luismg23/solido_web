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
    if params["profile"]
      @profile = Profile.new(params["profile"].permit(:email, :firstname, :lastname, :rol))
      if @profile.save
        redirect_to '/'
      else
        render new_profile_path(email: current_user.email)
      end    
    end

    @current_profile ||= Profile.find_by(email: current_user.email)
  
    if @current_profile.nil? && request.path != new_profile_path
      redirect_to new_profile_path(email: current_user.email)
      return
    end
  
    @current_profile
  end
end
