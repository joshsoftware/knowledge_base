class Screamout::ApplicationController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout 'application'
  protect_from_forgery with: :exception
  before_action :check_headers

  private

  def check_headers
    response.headers.delete("X-Frame-Options")
  end

end
