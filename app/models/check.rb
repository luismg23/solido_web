class Check
    include HTTParty
    base_uri Rails.application.config.base_api
    include ActiveModel::Model
    attr_accessor :fecha_emision_cheque, :concepto_cheque, :estatus_pago_cheque, :autorizado, :IdInterno, :IdInternoBanco, :num_cheque, :IdInternoPresupuesto, :Total, :TransaccionType, :IdProveedorFK
  
    def initialize(attributes = {})
      @fecha_emision_cheque = attributes[:fecha_emision_cheque]
      @concepto_cheque = attributes[:concepto_cheque]
      @estatus_pago_cheque = attributes[:estatus_pago_cheque]
      @autorizado = attributes[:autorizado]
      @IdInterno = attributes[:IdInterno]  
      @IdInternoBanco = attributes[:IdInternoBanco]  
      @IdInternoPresupuesto = attributes[:IdInternoPresupuesto]  
      @Total = attributes[:Total]  
      @TransaccionType = attributes[:TransaccionType]  
      @IdProveedorFK = attributes[:IdProveedorFK]  
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
      response = get("/checks/by_budget_id/#{id}")
      response.parsed_response
    end

    def self.pending(id)
        response = get("/checks/pending/#{id}")
        response.parsed_response
    end
  
    def self.create(data)
      response = HTTParty.post(
        "#{base_uri}/checks/",
        body: data.to_json,
        headers: {
          'Content-Type' => 'application/json'
        }
      )
      response.code
    end  
  end
  