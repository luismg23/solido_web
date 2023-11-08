class Bank
  include HTTParty
  base_uri 'http://127.0.0.1:3000'
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
    response = get('/banks/all', query: { page: page, per_page: per_page })
    response.parsed_response
  end

  def self.by_id(id)
    response = get("/banks/by_id/#{id}")
    response.parsed_response
  end

  def self.by_company_id(id)
    response = get("/banks/by_company_id/#{id}")
    response.parsed_response
  end

  def self.create(data)
    response = HTTParty.post(
      "#{base_uri}/banks/",
      body: data.to_json,
      headers: {
        'Content-Type' => 'application/json'
      }
    )
  
    response.parsed_response
  end  
end
