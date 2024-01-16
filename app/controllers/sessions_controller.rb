class Users::SessionsController < Devise::SessionsController

    protected

    def after_sign_in_path_for(resource)
        Rails.logger.info "entro aca"
        root_path
    end
    
end
  