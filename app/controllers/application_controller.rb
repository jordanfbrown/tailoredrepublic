class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate, :precompile_templates, :current_cart, :populate_user

  protected
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == "tailored" && password == "sodamnclean!"
      end
    end

    def precompile_templates
      if Rails.env.development?
        `handlebars app/assets/javascripts/backbone/templates/* -f app/assets/javascripts/templates.js`
      end
    end

  def current_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
    @cart
  end

  def populate_user
    if user_signed_in?
      @user_data = {
        name: current_user.name,
        email: current_user.email
      }
    else
      @user_data = {}
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

end
