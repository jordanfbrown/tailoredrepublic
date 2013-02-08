class RegistrationsController < Devise::RegistrationsController
  def edit
    @stripe_customer = resource.get_stripe_customer if resource.stripe_customer_id
    build_addresses
    super
  end

  def update
    params[:user] ||= {}
    @user = User.find(current_user.id)

    if (params[:user][:current_password] ? @user.update_with_password(params[:user]) : @user.update_attributes(params[:user]))
      unless params[:stripe_card_token].blank?
        @user.stripe_customer_id? ? @user.update_stripe_customer(params[:stripe_card_token]) :
            @user.create_stripe_customer(params[:stripe_card_token])
      end
      set_flash_message :notice, :updated
      sign_in @user, :bypass => true
      redirect_to edit_user_registration_path
    else
      build_addresses
      render "edit"
    end
  end

  def create
    build_resource

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        if request.xhr?
          unless params[:measurement_id].blank?
            measurement = Measurement.find(params[:measurement_id])
            measurement.user = resource
            measurement.save!
          end
          render json: {}
        else
          respond_with resource, :location => after_sign_up_path_for(resource)
        end
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      if request.xhr?
        render json: resource.errors, status: :unprocessable_entity
      else
        respond_with resource
      end
    end
  end

  protected

  def build_addresses
    resource.build_shipping_address if resource.shipping_address.nil?
    resource.build_billing_address if resource.billing_address.nil?
  end
end
