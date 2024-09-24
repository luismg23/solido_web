class HomeController < ApplicationController
  before_action :authenticate_user!

  def show
    @budgetlines = Budgetline.by_budget_id(4072)
  end

end