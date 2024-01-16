require 'httparty'

class RequestHandler
  include HTTParty
  include ActiveModel::Model

  def initialize(method)
    @method = method
  end

  def base_uri
    Rails.application.config.base_api
  end

  def all
    response = self.class.get("#{base_uri}/#{@method}/all")
    response.parsed_response
  end
end