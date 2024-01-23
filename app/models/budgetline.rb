class Budgetline
    include HTTParty
    base_uri Rails.application.config.base_api
    include ActiveModel::Model
    attr_accessor :cve_renglon_presupuestal, :nombre_renglon_presupuestal, :monto_presupuestado, :monto_erogado, :monto_por_erogar
  
    def initialize(attributes = {})
      @cve_renglon_presupuestal = attributes[:cve_renglon_presupuestal]
      @nombre_renglon_presupuestal = attributes[:nombre_renglon_presupuestal]
      @monto_presupuestado = attributes[:monto_presupuestado]
      @monto_erogado = attributes[:monto_erogado]
      @monto_por_erogar = attributes[:monto_por_erogar]  
    end
  
    def self.all(page = 1, per_page = 10)
      @request_ = RequestHandler.new('budgets')
      @request_.all
    end
  
    def self.unique_years()
      response = get("/budgets/unique_years")
      response.parsed_response  
    end

    def self.by_id(id)
      response = get("/budgets/by_id/#{id}")
      response.parsed_response
    end
  
    def self.by_budget_id(id)
      response = get("/budgetlines/by_budget_id/#{id}")
      response.parsed_response
    end
  
    def self.create(data)
      response = HTTParty.post(
        "#{base_uri}/budgetlines/",
        body: data.to_json,
        headers: {
          'Content-Type' => 'application/json'
        }
      )
      response.code
    end  
  end
  