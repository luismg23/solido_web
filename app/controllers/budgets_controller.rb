class BudgetsController < ApplicationController
  PAYMENT_METHODS = {
    1 => 'Cheque',
    2 => 'Transferencia',
    3 => 'Efectivo',
    4 => 'Tarjeta'
  }
  
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
          
    def new
      @companies = Supplier.all
      @bank = Bank.new
    end
  
    def create
      result = Budgetline.create(params)
      Rails.logger.info "el result es #{result}"
      if result == 200
        flash[:success] = "La empresa se creó exitosamente."
        redirect_to index
      else
        flash[:error] = "Hubo un error al crear la empresa."
        render :new
      end
    end

    def details  
      @budgetline = Budgetline.new
      @check = Check.new
      @payment_methods = PAYMENT_METHODS

      @budget = Budget.by_id(params[:id])
      @budgetlines = Budgetline.by_budget_id(params[:id])
      @banks = Bank.by_company_id(@budget["empresaid"])
      @suppliers = Supplier.by_company_id(@budget["empresaid"])
      @pending = Check.pending(params[:id])
    end

  private

    def apply_search_filters
      search_term = params[:search].downcase
      @budgets.select! { |budget| budget["nombre_presupuesto"].downcase.include?(search_term) }
      @searched = true
    end

    def filter_by_year(year)
      @budgets.select! { |budget| budget["anio_presupuesto"] == year.to_i }
    end

    def paginate_budgets
      @budgets = Kaminari.paginate_array(@budgets, total_count: @budgets.size).page(params[:page]).per(10)
    end

end