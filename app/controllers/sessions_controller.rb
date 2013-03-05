class SessionsController < Devise::SessionsController
  before_filter :store_redirect_to, only: :new

  def create
    params[:user] = params[:session_user]
    super
  end

  private
    def store_redirect_to
      unless request.referrer =~ /\/login/ || request.referrer =~ /\/logout/ || request.referrer =~ /\/account/
        session[:redirect_to] = request.referrer
      end
    end
end
