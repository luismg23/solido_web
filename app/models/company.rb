class Company
  include HTTParty
  base_uri Rails.application.config.base_api
  include ActiveModel::Model
  attr_accessor :IdInterno, :name, :address, :phone_number, :rfc

  def initialize(attributes = {})
    @IdInterno = attributes[:IdInterno]
    @name = attributes[:name]
    @address = attributes[:address]
    @phone_number = attributes[:phone_number]
    @rfc = attributes[:rfc]
  end

  def self.all
    response = get('/companies/all')
    response.parsed_response
  end

  def self.by_id(id)
    response = get("/companies/by_id/#{id}")

    if response.success?
      company_data = response.parsed_response
      Company.new(
        IdInterno: company_data["IdInterno"],
        name: company_data["Nombre"],
        address: company_data["Domicilio"],
        phone_number: company_data["Telefono"],
        rfc: company_data["RFC"]
      )
    else
      nil
    end
  end

  def self.create(data)
    response = HTTParty.post(
      "#{base_uri}/company/",
      body: data.to_json,
      headers: {
        'Content-Type' => 'application/json'
      }
    )

    response.parsed_response
  end
end
