class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate

  protected
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == "tailored" && password == "sodamnclean!"
      end
    end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

end
