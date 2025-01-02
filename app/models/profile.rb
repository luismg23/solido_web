class Profile < ApplicationRecord
  self.table_name = "profiles"
  attribute :id, :integer
  attribute :email, :string
  attribute :firstname, :string
  attribute :lastname, :string
  attribute :rol, :string

  enum rol: { super_admin: 'super_admin', admin: 'admin', user: 'user' }

  validates :email, presence: true, uniqueness: true
  validates :firstname, :lastname, :rol, presence: true

end
