class ChecksController < ApplicationController
    
  
    def create
      Rails.logger.info "los params son #{params}"
      result = Check.create(params)
      if result == 200
        flash[:success] = "El cheque se creó exitosamente."
        redirect_to request.referrer || root_path
      else
        flash[:error] = "Hubo un error al crear el cheque."
        render :new
      end
    end
end