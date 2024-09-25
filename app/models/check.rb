class Check
  include HTTParty
  base_uri Rails.application.config.base_api
  include ActiveModel::Model
  attr_accessor :fecha_emision_cheque, :concepto_cheque, :estatus_pago_cheque, :autorizado, :IdInterno, :IdInternoBanco, 
                :num_cheque, :IdInternoPresupuesto, :Total, :TransaccionType, :IdProveedorFK

  def initialize(attributes = {})
    @fecha_emision_cheque = attributes[:fecha_emision_cheque]
    @concepto_cheque = attributes[:concepto_cheque]
    @estatus_pago_cheque = attributes[:estatus_pago_cheque]
    @autorizado = attributes[:autorizado]
    @IdInterno = attributes[:IdInterno]
    @IdInternoBanco = attributes[:IdInternoBanco]
    @IdInternoPresupuesto = attributes[:IdInternoPresupuesto]
    @Total = attributes[:Total]
    @num_cheque = attributes[:num_cheque]
    @TransaccionType = attributes[:TransaccionType]
    @IdProveedorFK = attributes[:IdProveedorFK]
  end

  def self.all(page = 1, per_page = 10)
    @request_ = RequestHandler.new('budgets')
    @request_.all
  end

  def self.unique_years
    response = get("/budgets/unique_years")
    response.parsed_response
  end

  def self.by_id(id)
    response = get("/checks/by_id/#{id}")
    if response.success?
      Rails.logger.info response.parsed_response
      checks_data = response.parsed_response

      Check.new(
        fecha_emision_cheque: checks_data["fecha_emision_cheque"],
        concepto_cheque: checks_data["concepto_cheque"],
        estatus_pago_cheque: checks_data["estatus_pago_cheque"],
        autorizado: checks_data["autorizado"],
        IdInterno: checks_data["IdInterno"],
        IdInternoBanco: checks_data["IdInternoBanco"],
        IdInternoPresupuesto: checks_data["IdInternoPresupuesto"],
        Total: checks_data["Total"],
        TransaccionType: checks_data["TransaccionType"],
        num_cheque: checks_data["num_cheque"],
        IdProveedorFK: checks_data["IdProveedorFK"]
      )
    else
      nil
    end
  end

  def self.by_budget_id(id)
    response = get("/checks/by_budget_id/#{id}")
    response.parsed_response
  end

  def self.pending(id)
    response = get("/checks/pending/#{id}")
    response.parsed_response
  end

  def self.authorize(id)
    response = get("/checks/authorize/#{id["id"]}")
    response.code
  end

  def self.deauthorize(id)
    response = get("/checks/deauthorize/#{id["id"]}")
    response.code
  end

  def self.delete(id)
    response = get("/checks/delete/#{id["id"]}")
    response.code
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
