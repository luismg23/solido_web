class HomeController < ApplicationController
    
  def show
    @budgetlines = Budgetline.by_budget_id(4072)
  end

end