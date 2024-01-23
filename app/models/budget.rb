class Budget
    include HTTParty
    base_uri Rails.application.config.base_api
    include ActiveModel::Model
    attr_accessor :cve_presupuesto, :anio_presupuesto, :nombre_presupuesto, :monto_presupuestado, :monto_erogado, :monto_por_erogar, :IdInterno, :empresaid

    def initialize(attributes = {})
      @cve_presupuesto = attributes[:cve_presupuesto]
      @anio_presupuesto = attributes[:anio_presupuesto]
      @nombre_presupuesto = attributes[:nombre_presupuesto]
      @monto_presupuestado = attributes[:monto_presupuestado]
      @monto_erogado = attributes[:monto_erogado]
      @monto_por_erogar = attributes[:monto_por_erogar]
      @IdInterno = attributes[:IdInterno]
      @empresaid = attributes[:empresaid]
    end
  
    def self.all(page = 1, per_page = 10)
      response = get("/budgets/all")
      response.parsed_response  
    end
  
    def self.unique_years()
      response = get("/budgets/unique_years")
      response.parsed_response  
    end

    def self.by_id(id)
      response = get("/budgets/by_id/#{id}")
      response.parsed_response
    end
  
    def self.by_company_id(id)
      response = get("/budgets/by_company_id/#{id}")
      response.parsed_response
    end
  
    def self.create(data)
      response = HTTParty.post(
        "#{base_uri}/budgets/",
        body: data.to_json,
        headers: {
          'Content-Type' => 'application/json'
        }
      )
      response.code
    end  
  end
  