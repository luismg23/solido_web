class SearchsController < ApplicationController

  def index
    budget_finder
    budgetline_finder
  end

  def budget_finder
    budgets = Budget.all
    filtered_budgets = budgets.select do |presupuesto|
      presupuesto["IdInterno"] == params_filtered ||
      presupuesto["anio_presupuesto"] == params_filtered ||
      presupuesto["nombre_presupuesto"].downcase.include?(params_filtered.downcase)
    end
    @filtered_budgets = filtered_budgets.uniq
  end

  def budgetline_finder
    @filtered_budgetlines  = Budgetline.by_name(params_filtered)
  end

  def params_filtered
    params[:query]
  end
end