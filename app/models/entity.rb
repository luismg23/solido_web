class Entity
    include HTTParty
    base_uri Rails.application.config.base_api
    include ActiveModel::Model
    attr_accessor :id, :name, :display_name
  
    def initialize(attributes = {})
      @id = attributes[:id]
      @name = attributes[:name]
    end


    def self.all
      response = get('/entities/all')
      response.parsed_response
    end
end