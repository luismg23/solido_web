class BanksController < ApplicationController
  ENTITY_NAME = "bancos".freeze

  protect_from_forgery with: :exception
  #before_action :authenticate_user!, only: [:index]

  #skip_before_action :verify_authenticity_token, only: [:upload]
  helper_method :can_see?

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
    result = Bank.create(params)
    if result == 200
      flash[:success] = "El banco se creó exitosamente."
      redirect_to banks_path
    else
      flash[:error] = "Hubo un error al crear el banco."
      render :new
    end
  end

  def edit
    @companies = Company.all
    @bank = Bank.by_id(params[:id])
  end

  def update
    @bank = Bank.by_id(params[:id])
    if Bank.update(@bank.IdInterno, params["bank"])
      flash[:success] = "El banco se actualizó exitosamente."
      redirect_to banks_path
    else
      flash[:error] = "Hubo un error al actualizar el banco."
      redirect_to banks_path
    end
  end

  def destroy
    @bank = Bank.by_id(params[:id])
    result = Bank.delete(params[:id])
    if result != 500
      flash[:success] = "El banco se eliminó exitosamente."
      redirect_to banks_path
    else
      flash[:error] = "Hubo un error al eliminar el banco. Cuenta con movimientos ligados"
      redirect_to banks_path
    end
  end

  def upload
    if params[:file].present? && params[:file].is_a?(ActionDispatch::Http::UploadedFile)
      uploaded_file = params[:file]
      
      CSV.foreach(uploaded_file.path, headers: true) do |row|
      end
      render json: { success: true, message: "Archivo CSV procesado exitosamente" }
    else
      render json: { success: false, message: "No se proporcionó ningún archivo o el archivo no es válido" }
    end
  end

  #def can_see?(action)
  #  User.actions_by_user("luismg", ENTITY_NAME).include?(action)
  #end
end
