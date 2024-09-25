class ChecksController < ApplicationController 
  PAYMENT_METHODS = {
    1 => 'Cheque',
    2 => 'Transferencia',
    3 => 'Efectivo',
    4 => 'Tarjeta'
  }

  def details
    @payment_methods = PAYMENT_METHODS
    @budget = Budget.by_id(params[:id])
    @checks = Check.by_budget_id(@budget.IdInterno)
    if params[:sort].present? && params[:direction].present?
      @checks = @checks.sort_by do |check|
        value = check.send(params[:sort])
        value.nil? ? '' : value
      end
    
      @checks.reverse! if params[:direction] == 'desc'
    end
      end

  def show
    @payment_methods = PAYMENT_METHODS
    @check = Check.by_id(params[:id])
    @budget = Budget.by_id(@check.IdInternoPresupuesto)
    @supplier = Supplier.by_id(@check.IdProveedorFK)
  end

  def authorize
    result = Check.authorize(params)

    if result == 200
      flash[:success] = "El cheque aprobó correctamente."
      redirect_to request.referrer || root_path
    else
      flash[:error] = "Hubo un error al aprobar el cheque."
      render :new
    end
  end

  def deauthorize
    result = Check.deauthorize(params)

    if result == 200
      flash[:success] = "El cheque desaprobó correctamente."
      redirect_to request.referrer || root_path
    else
      flash[:error] = "Hubo un error al desaprobar el cheque."
      render :new
    end
  end

  def create
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
      flash[:success] = "La transacción se eliminó exitosamente."
      redirect_to request.referrer || root_path
    else
      flash[:error] = "Hubo un error al eliminar la transacción."
      redirect_to request.referrer || root_path
    end
  end
end
