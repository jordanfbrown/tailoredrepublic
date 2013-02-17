class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @user.build_measurement if @user.measurement.nil?
    @user.build_billing_address if @user.billing_address.nil?
    @user.build_shipping_address if @user.shipping_address.nil?
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete("password")
    end

    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to edit_user_path(@user), :notice => "User updated."
    else
      render 'edit'
    end
  end
    
  def destroy
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
end