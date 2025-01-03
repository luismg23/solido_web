class UsersController < ApplicationController
  #before_action :authenticate_user!

  protect_from_forgery with: :exception
  
  skip_before_action :verify_authenticity_token
  
  def index
    Rails.logger.info "el current_profile es #{current_profile}"
    @users = User.all
  end

  def details
  end

  def destroy
    user_to_delete = User.find(params[:id])
    profile_to_delete = Profile.find_by(email: user_to_delete.email)
  
    if user_to_delete&.destroy && profile_to_delete&.destroy
      redirect_to users_path, notice: 'Usuario y perfil eliminados correctamente.'
    else
      redirect_to users_path, alert: 'Hubo un error al eliminar al usuario o su perfil.'
    end
  end
end
