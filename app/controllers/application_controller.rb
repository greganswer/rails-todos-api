class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :authorize_request
  attr_reader :current_user

  def per_page 
    params[:per_page].to_i.between?(1, 100) ? params[:per_page].to_i : 20
  end

  #
  # PRIVATE
  #

  private

  # Check for valid request token and return user
  def authorize_request
    @current_user = AuthorizeApiRequest.new(request.headers).call[:user]
  end
end
