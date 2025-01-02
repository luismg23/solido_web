class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def can_login?
    profile = Profile.find_by(email: email)
    
    return false unless profile
    
    true
  end
end
