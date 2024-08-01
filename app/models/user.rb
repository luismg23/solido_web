class User < ApplicationRecord
  include HTTParty
  base_uri Rails.application.config.base_api
  include ActiveModel::Model
  attr_accessor :id, :username, :firstname, :lastname

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @firstname = attributes[:firstname]
    @lastname = attributes[:lastname]
  end
   
  def self.actions_by_user(username, entity)
    response = get("/users/actions_by_user/#{username}/#{entity}")
    response.parsed_response
  end  
end
