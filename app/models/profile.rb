class Profile < ApplicationRecord
  self.table_name = "profiles"
  attribute :id, :integer
  attribute :email, :string
  attribute :firstname, :string
  attribute :lastname, :string
  attribute :rol, :string
end