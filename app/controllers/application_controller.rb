class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :precompile_templates, :current_cart, :check_for_referral

  protected

  def precompile_templates
    if Rails.env.development?
      `handlebars app/assets/javascripts/backbone/templates/* -f app/assets/javascripts/templates.js`
      CUSTOMIZATIONS.replace YAML.load_file("#{Rails.root}/config/customizations.yml")
      MEASUREMENTS.replace YAML.load_file("#{Rails.root}/config/measurements.yml")
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if request.referrer =~ /\/login/ || request.referrer =~ /\/logout/ || request.referrer =~ /\/account/
      root_path
    else
      request.referrer
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    redirect_path = session[:redirect_to] || session[:user_return_to]
    session.delete(:redirect_to)
    redirect_path || edit_user_registration_path
  end

  def render_404
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end

  def get_measurement_from_cookie
    Measurement.find(cookies.signed[:measurement_id])
  rescue ActiveRecord::RecordNotFound
    nil
  end

  def add_referrer_if_referred_by(user)
    if session.has_key?(:referred_by)
      user.add_referrer(session[:referred_by])
      session.delete(:referred_by)
    end
  end

  def current_cart
    if user_signed_in? && !current_user.cart.nil?
      @cart = current_user.cart
    else
      @cart = Cart.includes(:line_items).find(cookies.signed[:cart_id])
    end
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create!
    cookies.permanent.signed[:cart_id] = @cart.id
    @cart
  end

  def check_for_referral
    @user_referred = session.has_key?(:referred_by)
  end

  rescue_from ActiveRecord::RecordNotFound do
    render_404
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

end