class BanksController < ApplicationController
  protect_from_forgery with: :exception
  #before_action :authenticate_user!, only: [:index]

  #skip_before_action :verify_authenticity_token, only: [:upload]

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
    Rails.logger.info "el result es #{result}"
    if result == 200
      flash[:success] = "El banco se creó exitosamente."
      redirect_to index
    else
      flash[:error] = "Hubo un error al crear el banco."
      render :new
    end
  end

  def upload
    Rails.logger.info "hola"

    if params[:file].present? && params[:file].is_a?(ActionDispatch::Http::UploadedFile)
      # Procesar el archivo CSV aquí
      uploaded_file = params[:file]
      
      # Puedes acceder a la información del archivo, por ejemplo:
      Rails.logger.info "Nombre del archivo: #{uploaded_file.original_filename}"
      Rails.logger.info "Tipo MIME del archivo: #{uploaded_file.content_type}"
      Rails.logger.info "Tamaño del archivo: #{uploaded_file.size} bytes"

      # Lógica adicional para procesar el archivo CSV, por ejemplo:
      CSV.foreach(uploaded_file.path, headers: true) do |row|
        # Procesar cada fila del archivo CSV
        Rails.logger.info "Fila del CSV: #{row}"
      end

      # Puedes realizar más acciones según tus necesidades

      render json: { success: true, message: "Archivo CSV procesado exitosamente" }
    else
      render json: { success: false, message: "No se proporcionó ningún archivo o el archivo no es válido" }
    end
  end
  
  private

end
