class SuppliersController < ApplicationController

  def show
    
  end

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

  def update
    @supplier = Supplier.by_id(params[:id])
    if Supplier.update(@supplier.IdInterno, params["supplier"])
      flash[:success] = "El proveedor se actualizó exitosamente."
      redirect_to suppliers_path
    else
      flash[:error] = "Hubo un error al actualizar el proveedor."
      redirect_to suppliers_path
    end
  end

  def destroy
    @supplier = Supplier.by_id(params[:id])
    result = Supplier.delete(params[:id])
    if result != 500
      flash[:success] = "El proveedor se eliminó exitosamente."
      redirect_to suppliers_path
    else
      flash[:error] = "Hubo un error al eliminar el proveedor. Cuenta con movimientos ligados"
      redirect_to suppliers_path
    end
  end

  def edit
    @companies = Company.all
    @supplier = Supplier.by_id(params[:id])
  end

  private
end
