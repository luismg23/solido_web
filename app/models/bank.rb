class Bank < ApplicationRecord
  include HTTParty
  base_uri 'http://127.0.0.1:3000'  # Reemplaza con la URL real de la API

  def self.all
    response = get('/banks/all')
    response.parsed_response
  end

  def self.by_id(id)
    response = get("/banks/by_id/#{id}")
    response.parsed_response
  end

  def self.by_company_id(id)
    response = get("/banks/by_company_id/#{id}")
    response.parsed_response
  end
end
