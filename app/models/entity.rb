class Entity
    include HTTParty
    base_uri 'http://127.0.0.1:3000'
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