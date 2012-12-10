class HomeController < ApplicationController
  def index
    @users = User.all
    puts @users
  end
end
