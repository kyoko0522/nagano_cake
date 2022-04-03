# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :reject_inactive_customer, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def after_sign_in_path_for(resource)
    root_path
  end
  def reject_inactive_customer
    @customer = Customer.find(params[:id])
    if @customer
      if @customer.deleted_password?(params[:id]) && !@customer.is_deleted
        redirect_to new_customer_session_path
      end
    end
  end
end
