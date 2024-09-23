class DetailsController < ApplicationController
    
  
    def create
      result = Detail.create(params)
      if result == 200
        flash[:success] = "El detalle se creó exitosamente."
        redirect_to request.referrer || root_path
      else
        flash[:error] = "Hubo un error al crear el detalle."
        render :new
      end
    end

    def destroy
      result = Detail.delete(params)
      if result == 200
        flash[:success] = "El detalle se elimino exitosamente."
        redirect_to request.referrer || root_path
      else
        flash[:error] = "Hubo un error al eliminar el detalle."
        redirect_to request.referrer || root_path
      end
    end
end