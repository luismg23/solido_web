class SuppliersController < ApplicationController
    
    def index
      @supplier = Supplier.new
      @suppliers = Supplier.all
      @searched = false
  
      if params[:search].present?
        search_term = params[:search].downcase
        @suppliers = @suppliers.select { |supplier| supplier["Nombre"].downcase.include?(search_term) }
        @searched = true
      end
      @suppliers = Kaminari.paginate_array(@suppliers, total_count: @suppliers.size).page(params[:page]).per(10)
      @bank = Bank.new
    end
        
    def new
      @companies = Supplier.all
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
    
    private
  
  end