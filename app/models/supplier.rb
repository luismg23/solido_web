class Supplier
    include HTTParty
    base_uri Rails.application.config.base_api
    include ActiveModel::Model
    attr_accessor :IdInterno, :name, :calle, :colonia, :ciudad, :estado, :telefono, :rfc, :representante, :empresa_fk, :persona, :email
  
    def initialize(attributes = {})
      @IdInterno = attributes[:IdInterno]
      @name = attributes[:name]
      @calle = attributes[:calle]
      @colonia = attributes[:colonia]
      @ciudad = attributes[:ciudad]
      @estado = attributes[:estado]
      @rfc = attributes[:rfc]
      @representante = attributes[:representante]
      @ciudad = attributes[:ciudad]
      @telefono = attributes[:telefono]
      @persona = attributes[:persona]
      @email = attributes[:email]
      @empresa_fk = attributes[:empresa_fk]
    end

    def self.all
      response = get('/suppliers/all')
      response.parsed_response
    end
  
    def self.by_id(id)
      response = get("/suppliers/by_id/#{id}")
      if response.success?
        supplier_data = response.parsed_response
        Supplier.new(
          IdInterno: supplier_data["IdInterno"],
          name: supplier_data["Nombre"],
          calle: supplier_data["Calle"],
          colonia: supplier_data["Colonia"],
          ciudad: supplier_data["Ciudad"],
          estado: supplier_data["Estado"],
          rfc: supplier_data["RFC"],
          representante: supplier_data["Representante"],
          telefono: supplier_data["Telefono"],
          ciudad: supplier_data["Ciudad"],
          persona: supplier_data["Persona"],
          email: supplier_data["Email"],
          empresa_fk: supplier_data["empresa_fk"]
        )
      else
        nil
      end
    end
  
    def self.by_company_id(id)
      response = get("/suppliers/by_company_id/#{id}")
      response.parsed_response
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

    def self.update(id, data)
      response = HTTParty.patch(
        "#{base_uri}/suppliers/#{id}/",
        body: data.to_json,
        headers: {
          'Content-Type' => 'application/json'
        }
      )
      Rails.logger.info "response: #{response.inspect}"
      response.code
    end
  
    def self.delete(id)
      response = HTTParty.delete(
        "#{base_uri}/suppliers/#{id}/",
        headers: {
          'Content-Type' => 'application/json'
        }
      )
      response.code
    end
  end
