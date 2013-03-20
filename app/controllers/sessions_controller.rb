class SessionsController < Devise::SessionsController
  before_filter :store_redirect_to, only: :new
  after_filter :set_cart, only: :create

  def create
    params[:user] = params[:session_user]
    super
  end

  private
    def store_redirect_to
      unless request.referrer =~ /\/login/ || request.referrer =~ /\/logout/ || request.referrer =~ /\/account/
        session[:redirect_to] = request.referrer unless request.referrer.nil?
      end
    end

    def set_cart
      if current_user.cart.nil?
        @cart.user = current_user
        @cart.save
      end
    end
end
