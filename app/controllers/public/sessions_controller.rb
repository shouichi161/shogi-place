# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController

  # before_action :configure_sign_in_params, only: [:create]
  before_action :customer_state,only: [:create]
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



  def guest_sign_in
    customer=Customer.guest
    sign_in customer
    flash[:notice]="ゲストユーザーとしてログインしました。"
    redirect_to post_shogi_places_path
  end

  def after_sign_in_path_for(resource)
    post_shogi_places_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def customer_state
    @customer=Customer.find_by(name: params[:customer][:name])
    return if !@customer

    if @customer.valid_password?(params[:customer][:password]) && !(@customer.membership_status=="member")
      flash[:notice]="退会済みなのでログインできません。"
      redirect_to new_customer_registration_path
    end
  end
end
