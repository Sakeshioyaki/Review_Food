# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
    before_action :configure_permitted_parameters, if: :devise_controller?
  #GET /resource/sign_in
  #  def new
  #    @user = current_user
  #    super
  #  end
   
  #  def show
  #    @user = current_user
  #  end

  # #POST /resource/sign_in
  #  def create
  #    @user = current_user
  #    super
  #  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
