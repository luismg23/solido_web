class Supplier
    include HTTParty
    base_uri Rails.application.config.base_api
    include ActiveModel::Model
    attr_accessor :id, :name, :address, :phone_number, :rfc
  
    def initialize(attributes = {})
      @id = attributes[:IdInterno]
      @name = attributes[:Nombre]
      @address = attributes[:Domicilio]
      @phone_number = attributes[:Telefono]
      @rfc = attributes[:RFC]
    end


    def self.all
      response = get('/suppliers/all')
      response.parsed_response
    end
  
    def self.by_id(id)
      response = get("/suppliers/by_id/#{id}")
      response.parsed_response
    end
  
    def self.by_company_id(id)
      response = get("/suppliers/by_company_id/#{id}")
      response.parsed_response
    end
  
    def self.create(data)
      Rails.logger.info "la data es: #{data}"
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
  