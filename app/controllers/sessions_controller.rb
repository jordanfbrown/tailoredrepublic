class SessionsController < Devise::SessionsController
  before_filter :store_redirect_to, only: :new

  def create
    params[:user] = params[:session_user]
    super
  end

  private
    def store_redirect_to
      session[:redirect_to] = request.referrer unless request.referrer =~ /\/users/
    end
end
