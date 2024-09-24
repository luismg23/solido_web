class UsersController < ApplicationController
  #before_action :authenticate_user!

  protect_from_forgery with: :exception
  
  skip_before_action :verify_authenticity_token
  
  def index
    @users = User.all
  end
end
