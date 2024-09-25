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

    Rails.logger.info "los checkdetails son #{@checkdetails}"
    detail_ids = @checkdetails.pluck("IdInternoCheque").uniq
    checks = detail_ids.map do |detail_id|
      Check.by_id(detail_id)
    end

    Rails.logger.info "los checks son #{checks}"
    @checks = checks.sort_by  { |cheque| DateTime.parse(cheque["fecha_emision_cheque"]) }
    cheques_hash = @checks.each_with_object({}) do |cheque, hash|
      hash[cheque["IdInterno"]] = cheque
    end
    
    @merged_details = @checkdetails.map do |detail|
      cheque = cheques_hash[detail["IdInternoCheque"]]
      detail.merge(cheque)
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
