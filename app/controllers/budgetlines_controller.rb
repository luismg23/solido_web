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

    def details     
      @budget = Budget.by_id(params[:id])
      @budgetlines = Budgetline.by_budget_id(params[:id])
      @budgetline = Budgetline.new
    end

end