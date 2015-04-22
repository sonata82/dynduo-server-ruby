class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate

  def authenticate
    if !Rails.env.development?
      if request.format != Mime::JSON
        authenticate_or_request_with_http_basic do |username, password|
          username == Rails.configuration.auth.username && password == Rails.configuration.auth.password
        end
      end
    end
  end

end
