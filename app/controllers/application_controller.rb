class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :precompile_templates, :current_cart

  protected
    def precompile_templates
      if Rails.env.development?
        `handlebars app/assets/javascripts/backbone/templates/* -f app/assets/javascripts/templates.js`
        CUSTOMIZATIONS.replace YAML.load_file("#{Rails.root}/config/customizations.yml")
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

    def render_404
      render file: "#{Rails.root}/public/404.html", status: 404, layout: false
    end

    def get_measurement_from_session
      Measurement.find(session[:measurement_id])
    rescue ActiveRecord::RecordNotFound
      nil
    end

  def current_cart
    @cart = Cart.includes(:line_items).find(cookies.signed[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create!
    cookies.permanent.signed[:cart_id] = @cart.id
    @cart
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

end
