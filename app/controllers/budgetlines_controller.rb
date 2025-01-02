class BudgetlinesController < ApplicationController 
  def index
    @budgets = Budget.all
    @years = Budget.unique_years
    @searched = false
    
    apply_search_filters if params[:search].present?
    
    latest_year = params[:year].presence || @years.max
    filter_by_year(latest_year)
    
    paginate_budgets
    
    @bank = Bank.new
  end

  def show
    @budgetline = Budgetline.by_id(params[:id])
    @budget = Budget.by_id(@budgetline['IdInternoPresupuesto'])
    @checkdetails = Detail.by_budgetline_id(@budgetline["IdInterno"])
    @banks = Bank.all

    detail_ids = @checkdetails.map(&:IdInternoCheque).uniq
    checks = detail_ids.map do |detail_id|
      Check.by_id(detail_id)
    end

    @checks = checks.sort_by do |cheque|
      fecha = cheque.fecha_emision_cheque
      fecha.nil? ? DateTime.new(0) : DateTime.parse(fecha)
    end
    cheques_hash = @checks.each_with_object({}) do |cheque, hash|
    hash[cheque.IdInterno] = cheque
    end
    @merged_details = @checkdetails.map do |detail|
      cheque = cheques_hash[detail.IdInternoCheque]
    
      detail_hash = {
        importe_renglon: detail.instance_variable_get(:@importe_renglon),
        id_interno: detail.instance_variable_get(:@IdInterno),
        id_interno_cheque: detail.instance_variable_get(:@IdInternoCheque),
        id_interno_renglon: detail.instance_variable_get(:@IdInternoRenglon),
        description: detail.instance_variable_get(:@description)
      }
    
      cheque_hash = cheque ? {
        fecha_emision_cheque: cheque.instance_variable_get(:@fecha_emision_cheque),
        concepto_cheque: cheque.instance_variable_get(:@concepto_cheque),
        estatus_pago_cheque: cheque.instance_variable_get(:@estatus_pago_cheque),
        autorizado: cheque.instance_variable_get(:@autorizado),
        id_interno: cheque.instance_variable_get(:@IdInterno),
        id_interno_banco: cheque.instance_variable_get(:@IdInternoBanco),
        id_interno_presupuesto: cheque.instance_variable_get(:@IdInternoPresupuesto),
        total: cheque.instance_variable_get(:@Total),
        num_cheque: cheque.instance_variable_get(:@num_cheque),
        transaccion_type: cheque.instance_variable_get(:@TransaccionType),
        id_proveedor_fk: cheque.instance_variable_get(:@IdProveedorFK)
      } : {}
    
      detail_hash.merge(cheque_hash)
    end
  end
          
  def new
    @companies = Supplier.all
    @bank = Bank.new
  end
  
  def create
    result = Budgetline.create(params)
    if result == 200
      flash[:success] = "El renglón se creó exitosamente."
      redirect_to request.referrer || root_path
    else
      flash[:error] = "Hubo un error al crear el renglón."
      render :new
    end
  end

  def destroy
    result = Budgetline.delete(params)
    if result == 200
      flash[:success] = "El renglón se elimino exitosamente."
      redirect_to request.referrer || root_path
    else
      flash[:error] = "Hubo un error al eliminar el renglón."
      redirect_to request.referrer || root_path
    end
  end

  def details     
    @budget = Budget.by_id(params[:id])
    @budgetlines = Budgetline.by_budget_id(params[:id])
    @budgetline = Budgetline.new
  end
end
