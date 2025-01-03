class ErrorsController < ApplicationController
  def unauthorized
    render status: :forbidden
  end

  def show_navbar?
    false
  end

end
