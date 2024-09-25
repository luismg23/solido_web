class BulkUploadController < ApplicationController 
  def index
  end

  def create
    uploaded_file = params[:csv_file]

    if uploaded_file
      CSV.foreach(uploaded_file.path, headers: true) do |row|
        Rails.logger.info row
      end
      flash[:notice] = "Archivo CSV subido y procesado con éxito."
    else
      flash[:alert] = "No se seleccionó ningún archivo."
    end

    redirect_to action: :index
  end

  def download_layout
    send_data generate_layout, filename: "layout.csv", type: "text/csv"
  end

  private

  def generate_layout
    CSV.generate(headers: true) do |csv|
      csv << ["Columna1", "Columna2", "Columna3"]
    end
  end
end