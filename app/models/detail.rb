class Detail
    include HTTParty
    base_uri 'http://127.0.0.1:3000'
    include ActiveModel::Model
    attr_accessor :importe_renglon, :IdInterno, :IdInternoCheque, :IdInternoRenglon

    def initialize(attributes = {})
      @importe_renglon = attributes[:importe_renglon]
      @IdInterno = attributes[:IdInterno]
      @IdInternoCheque = attributes[:IdInternoCheque]
      @IdInternoRenglon = attributes[:IdInternoRenglon]
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

    def self.pending(id)
        response = get("/checks/pending/#{id}")
        response.parsed_response
    end
  
    def self.create(data)
      response = HTTParty.post(
        "#{base_uri}/details/",
        body: data.to_json,
        headers: {
          'Content-Type' => 'application/json'
        }
      )
      response.code
    end  
  end
  