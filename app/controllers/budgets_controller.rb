class BudgetsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:demo]

  PAYMENT_METHODS = {
    1 => 'Cheque',
    2 => 'Transferencia',
    3 => 'Efectivo',
    4 => 'Tarjeta'
  }
  
    def index
      @years = Budget.unique_years
      @searched = false
      @companies = Company.all

      apply_search_filters if params[:search].present?
    
      latest_year = params[:year].presence || @years.max
      @budgets = Budget.by_year(latest_year)
    
      paginate_budgets
    
      @bank = Bank.new
      @budget = Budget.new
    end
          
    def new
      @companies = Supplier.all
      @bank = Bank.new
    end
  
    def create
      result = Budget.create(params)

      if result == 200
        flash[:success] = "El presupuesto se creó exitosamente."
        redirect_to request.referrer || root_path
      else
        flash[:error] = "Hubo un error al crear el presupuesto."
        render :new
      end
    end

    def details  
      @budgetline = Budgetline.new
      @check = Check.new
      @detail = Detail.new
      @payment_methods = PAYMENT_METHODS

      @budget = Budget.by_id(params[:id])
      @budgetlines = Budgetline.by_budget_id(params[:id])
      @banks = Bank.by_company_id(@budget["empresaid"])

      @suppliers = Supplier.by_company_id(@budget["empresaid"])
      @pending = Check.pending(params[:id])
      @amount_available = budget_amount_available
      @checkdetails = Detail.by_budget_id(params[:id])

      checks = Check.by_budget_id(params[:id])
      @checks = checks.sort_by { |check| DateTime.parse(check["fecha_emision_cheque"]) }.reverse
                        
      @available_budgetlines = Budgetline.by_budget_id(params[:id])
      @pending_checks = Check.by_budget_id(params[:id])
    end

    private

    def apply_search_filters
      search_term = params[:search].downcase
      @budgets.select! { |budget| budget["nombre_presupuesto"].downcase.include?(search_term) }
      @searched = true
    end

    def paginate_budgets
      @budgets = Kaminari.paginate_array(@budgets, total_count: @budgets.size).page(params[:page]).per(10)
    end

    def budget_amount_available
      Rails.logger.info "los budgetlines son #{@budgetlines}"
      amount = @budgetlines.map { |element| element["monto_presupuestado"] }.sum
      total = @budget["monto_presupuestado"]
      Rails.logger.info "el budget es  #{@budget.inspect}"
      Rails.logger.info "el total es #{total}"
      Rails.logger.info "el amount es #{amount}"
      available = total -= amount
      available
    end

end