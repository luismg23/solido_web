class BanksController < ApplicationController

  def index
    @companies = Company.all
    @banks = Bank.all
    @searched = false

    if params[:search].present?
      search_term = params[:search].downcase
      @banks = @banks.select { |bank| bank["nombre_banco"].downcase.include?(search_term) }
      @searched = true
    end
    @banks = Kaminari.paginate_array(@banks, total_count: @banks.size).page(params[:page]).per(10)
    @bank = Bank.new
  end
      
  def new
    @companies = Company.all
    @bank = Bank.new
  end

  def create
    @bank = Bank.create(params)
  end

  private

end
