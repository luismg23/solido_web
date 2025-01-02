class ProfilesController < ApplicationController
  include RolesHelper

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def new
    @profile = Profile.new(email: params[:email])
  end

  def create

  end

  private

  def profile_params
    params.require(:profile).permit(:email, :firstname, :lastname, :rol)
  end
end
