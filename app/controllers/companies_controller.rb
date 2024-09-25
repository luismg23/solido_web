class CompaniesController < ApplicationController
    
  def index
    @company = Company.new
    @companies = Company.all
    @searched = false

    if params[:search].present?
      search_term = params[:search].downcase
      @companies = @companies.select { |bank| bank["Nombre"].downcase.include?(search_term) }
      @searched = true
    end
    @companies = Kaminari.paginate_array(@companies, total_count: @companies.size).page(params[:page]).per(10)
    @companie = Bank.new
  end
      
  def new
    @companies = Company.all
    @bank = Bank.new
  end

  def create
    result = Bank.create(params)
    if result == 200
      flash[:success] = "La empresa se creó exitosamente."
      redirect_to index
    else
      flash[:error] = "Hubo un error al crear la empresa."
      render :new
    end
  end

  def edit
    @company = Company.by_id(params[:id])
  end
  
  private

end