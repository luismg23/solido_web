class Budget
  include HTTParty
  base_uri Rails.application.config.base_api
  include ActiveModel::Model

  attr_accessor :cve_presupuesto, :anio_presupuesto, :nombre_presupuesto, :monto_presupuestado, 
                :monto_erogado, :monto_por_erogar, :IdInterno, :empresa_fk

  def initialize(attributes = {})
    @cve_presupuesto = attributes[:cve_presupuesto]
    @anio_presupuesto = attributes[:anio_presupuesto]
    @nombre_presupuesto = attributes[:nombre_presupuesto]
    @monto_presupuestado = attributes[:monto_presupuestado]
    @monto_erogado = attributes[:monto_erogado]
    @monto_por_erogar = attributes[:monto_por_erogar]
    @IdInterno = attributes[:IdInterno]
    @empresa_fk = attributes[:empresa_fk]
  end

  def self.all(page = 1, per_page = 10)
    response = get("/budgets/all")
    response.parsed_response  
  end

  def self.by_year(year)
    response = get("/budgets/by_year/#{year}")
    response.parsed_response  
  end

  def self.unique_years
    response = get("/budgets/unique_years")
    response.parsed_response  
  end

  def self.by_id(id)
    response = get("/budgets/by_id/#{id}")
    if response.success?
      budget_data = response.parsed_response
      puts response.parsed_response
      Budget.new(
        IdInterno: budget_data["IdInterno"],
        cve_presupuesto: budget_data["cve_presupuesto"],
        anio_presupuesto: budget_data["anio_presupuesto"],
        nombre_presupuesto: budget_data["nombre_presupuesto"],
        monto_presupuestado: budget_data["monto_presupuestado"],
        monto_erogado: budget_data["monto_erogado"],
        monto_por_erogar: budget_data["monto_por_erogar"],
        empresa_fk: budget_data["empresaid"]
      )
    else
      nil
    end
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
