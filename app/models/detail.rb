class Detail
    include HTTParty
    base_uri Rails.application.config.base_api
    include ActiveModel::Model
    attr_accessor :importe_renglon, :IdInterno, :IdInternoCheque, :IdInternoRenglon, :description

    def initialize(attributes = {})
      @importe_renglon = attributes[:importe_renglon]
      @IdInterno = attributes[:IdInterno]
      @IdInternoCheque = attributes[:IdInternoCheque]
      @IdInternoRenglon = attributes[:IdInternoRenglon]
      @description = attributes[:description]
    end
  
    def self.all(page = 1, per_page = 10)
        response = get("/checkdetails/all")
        response.parsed_response  
    end
  
    def self.unique_years()
      response = get("/budgets/unique_years")
      response.parsed_response  
    end

    def self.by_id(id)
      response = get("/checkdetails/by_id/#{id}")
      response.parsed_response
    end
  
    def self.by_budget_id(id)
      response = get("/checkdetails/by_budget_id/#{id}")
      response.parsed_response
    end

    def self.by_budgetline_id(id)
      response = get("/checkdetails/by_budgetline_id/#{id}")
      response.parsed_response
    end

    def self.pending(id)
        response = get("/checks/pending/#{id}")
        response.parsed_response
    end

    def self.delete(id)
      response = get("/checkdetails/delete/#{id["id"]}")
      response.code
    end
  
    def self.create(data)
      response = HTTParty.post(
        "#{base_uri}/checkdetails/",
        body: data.to_json,
        headers: {
          'Content-Type' => 'application/json'
        }
      )
      response.code
    end  
  end
  