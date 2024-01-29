class HomeController < ApplicationController
    
  def show
    @budgetlines = Budgetline.by_budget_id(4072)
    Rails.logger.info "los budgets son #{@budgetlines}"
  end

end