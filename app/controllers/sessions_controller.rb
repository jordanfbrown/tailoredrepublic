class SessionsController < Devise::SessionsController
  before_filter :store_redirect_to, only: :new

  private
    def store_redirect_to
      session[:redirect_to] = request.referrer
    end
end
