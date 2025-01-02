# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  skip_before_action :assert_reset_token_passed, only: [:edit]
  skip_before_action :require_no_authentication, only: [:edit, :update]
  before_action :set_user


  def new
    # Redirige al formulario de edición directamente (o a un usuario específico si lo deseas)
    redirect_to edit_user_password_path(reset_password_token: params[:reset_password_token])
  end

  def edit
    Rails.logger.info "en el edit"
    # Si el usuario está autenticado, permite editar su contraseña
    if @user
      self.resource = @user
      render :edit
    else
      redirect_to new_user_session_path, alert: "Debes estar autenticado para cambiar tu contraseña."
    end
  end

  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  def update
    # Obtener al usuario actual
    self.resource = @user

    # Actualizar la contraseña sin el token
    if resource.update(password_params)
      #bypass_sign_in(resource) # Vuelve a autenticar al usuario con la nueva contraseña
      redirect_to '/', notice: "Tu contraseña ha sido cambiada con éxito."
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation, :id)
  end

  def set_user
    @user = User.find(params[:id] || password_params[:id])
  end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
