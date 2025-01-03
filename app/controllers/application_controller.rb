class ApplicationController < ActionController::Base
  include CableReady::Broadcaster
  include RolesHelper

  before_action :current_user
  before_action :current_profile, except: [:unauthorized]
  helper_method :current_user
  helper_method :current_profile
  helper_method :show_navbar?
  before_action :authenticate_user!

  def current_user
    @current_user ||= warden.user(:user) if warden.user(:user)
  end

  def current_profile
    if params["profile"]
      @profile = Profile.new(params["profile"].permit(:email, :firstname, :lastname, :rol))
      if @profile.save
        redirect_to users_path
      end    
    end

    @current_profile ||= Profile.find_by(email: current_user.email) if current_user
  
    if @current_profile.nil? && !current_user.nil?
      redirect_to unauthorized_path and return
    end

    @current_profile
  end

  def show_navbar?
    true
  end
end
