class RegistrationsController < Devise::RegistrationsController
  def edit
    @stripe_customer = resource.get_stripe_customer if resource.stripe_customer_id
    super
  end

  def update
    # required for settings form to submit when password is left blank
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end

    @user = User.find(current_user.id)
    params[:user][:shipping_address_attributes] = params[:shipping_address]
    params[:user][:billing_address_attributes] = params[:billing_address]

    if @user.update_attributes(params[:user])
      if params[:stripe_card_token]
        @user.stripe_customer_id? ? @user.update_stripe_customer(params[:stripe_card_token]) :
          @user.create_stripe_customer(params[:stripe_card_token])
      end
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to edit_user_registration_path
    else
      render "edit"
    end
  end
end
