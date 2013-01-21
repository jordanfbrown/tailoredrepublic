class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate, :precompile_templates, :current_cart

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

    def after_sign_out_path_for(resource_or_scope)
      request.referrer
    end

    def after_sign_in_path_for(resource_or_scope)
      redirect_path = session[:redirect_to] || session[:user_return_to]
      session.delete :redirect_to
      redirect_path || edit_user_registration_path
    end

    def get_measurement_from_session
      Measurement.find(session[:measurement_id])
    rescue ActiveRecord::RecordNotFound
      nil
    end

  def current_cart
    @cart = Cart.includes(:line_items).find(cookies.signed[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    cookies.permanent.signed[:cart_id] = @cart.id
    @cart
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

end
