class DetailsController < ApplicationController
    
  
    def create
      Rails.logger.info "los params son #{params}"
      result = Detail.create(params)
      if result == 200
        flash[:success] = "El detalle se creó exitosamente."
        redirect_to request.referrer || root_path
      else
        flash[:error] = "Hubo un error al crear el detalle."
        render :new
      end
    end
end