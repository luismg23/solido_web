class Bank
  include HTTParty
  base_uri Rails.application.config.base_api
  include ActiveModel::Model
  attr_accessor :cve_banco, :sucursal_banco, :direccion_banco, :telefono_banco, :nombre_banco, :IdInterno, :empresa_fk

  def initialize(attributes = {})
    @cve_banco = attributes[:cve_banco]
    @sucursal_banco = attributes[:sucursal_banco]
    @direccion_banco = attributes[:direccion_banco]
    @telefono_banco = attributes[:telefono_banco]
    @nombre_banco = attributes[:nombre_banco]
    @IdInterno = attributes[:IdInterno]
    @empresa_fk = attributes[:empresa_fk]

  end

  def self.all(page = 1, per_page = 10)
    response = get("/banks/all/")
    response.parsed_response
  end

  def self.by_id(id)
    response = get("/banks/by_id/#{id}")

    if response.success?
      bank_data = response.parsed_response

      Bank.new(
        IdInterno: bank_data["IdInterno"],
        cve_banco: bank_data["cve_banco"],
        sucursal_banco: bank_data["sucursal_banco"],
        direccion_banco: bank_data["direccion_banco"],
        telefono_banco: bank_data["telefono_banco"],
        nombre_banco: bank_data["nombre_banco"],
        empresa_fk: bank_data["empresa_fk"]
      )
    else
      nil
    end
  end

  def self.update(id, data)
    response = HTTParty.patch(
      "#{base_uri}/banks/#{id}/",
      body: data.to_json,
      headers: {
        'Content-Type' => 'application/json'
      }
    )
    response.code
  end

  def self.delete(id)
    response = HTTParty.delete(
      "#{base_uri}/banks/#{id}/",
      headers: {
        'Content-Type' => 'application/json'
      }
    )
    response.code
  end

  def self.by_company_id(id)
    response = get("/banks/by_company_id/#{id}")
    if response.success?
      bank_data_array = response.parsed_response
  
      bank_data_array.map do |bank_data|
        Bank.new(
          IdInterno: bank_data["IdInterno"],
          cve_banco: bank_data["cve_banco"],
          sucursal_banco: bank_data["sucursal_banco"],
          direccion_banco: bank_data["direccion_banco"],
          telefono_banco: bank_data["telefono_banco"],
          nombre_banco: bank_data["nombre_banco"],
          empresa_fk: bank_data["empresa_fk"]
        )
      end
    else
      []
    end
  end

  def self.create(data)
    response = HTTParty.post(
      "#{base_uri}/banks/",
      body: data.to_json,
      headers: {
        'Content-Type' => 'application/json'
      }
    )
    response.code
  end  
end
