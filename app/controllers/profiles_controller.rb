class ProfilesController < ApplicationController
  include RolesHelper

  protect_from_forgery with: :exception
  before_action :authenticate_super_admin!, only: [:new]


  def new
    @profile = Profile.new(email: params[:email])
  end

  def create

  end

  private

  def profile_params
    params.require(:profile).permit(:email, :firstname, :lastname, :rol)
  end

  def authenticate_super_admin!
    unless admin?(current_profile&.rol)
      redirect_to unauthorized_path and return
    end
  end

end
