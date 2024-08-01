class ChecksController < ApplicationController  
  def authorize
    result = Check.authorize(params)

    if result == 200
      flash[:success] = "El cheque aprobo correctamente."
      redirect_to request.referrer || root_path
    else
      flash[:error] = "Hubo un error al aprobar el cheque."
      render :new
    end
  end

  def deauthorize
    result = Check.deauthorize(params)

    if result == 200
      flash[:success] = "El cheque desaprobo correctamente."
      redirect_to request.referrer || root_path
    else
      flash[:error] = "Hubo un error al desaprobar el cheque."
      render :new
    end
  end


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

    def destroy
      result = Check.delete(params)
      if result == 200
        flash[:success] = "La transacción se elimino exitosamente."
        redirect_to request.referrer || root_path
      else
        flash[:error] = "Hubo un error al eliminar la transacción."
        redirect_to request.referrer || root_path
      end
    end

end
