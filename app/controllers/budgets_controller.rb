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
    @banks = Bank.by_company_id(@budget.empresa_fk)

    @suppliers = Supplier.by_company_id(@budget.empresa_fk)
    @pending = Check.pending(params[:id])
    @amount_available = budget_amount_available

    @available_budgetlines = Budgetline.by_budget_id(params[:id])
    @pending_checks = Check.by_budget_id(params[:id])
  end

  def export
    @budget = Budget.by_id(params[:id])

    data = [
      ["Nombre", "Edad", "Ciudad"],
      ["Juan", 28, "Madrid"],
      ["Ana", 22, "Barcelona"],
      ["Luis", 31, "Valencia"]
    ]

    csv_data = CSV.generate(headers: true) do |csv|
      csv << ["Nombre", "Edad", "Ciudad"]
      data.each do |user|
        csv << user
      end
    end

    respond_to do |format|
      format.csv { send_data csv_data, filename: "presupuesto_#{@budget["IdInterno"]}_#{@budget["nombre_presupuesto"]}_#{Date.today}.csv" }
    end
  end

  def edit
    @companies = Company.all
    @budget = Budget.by_id(params[:id])
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
    amount = @budgetlines.map { |element| element["monto_presupuestado"] }.sum
    total = @budget.monto_presupuestado
    available = total -= amount
    available
  end
end
