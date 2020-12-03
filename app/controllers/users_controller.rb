class UsersController < ApplicationController
    # before_action :configure_permitted_parameters, if: :devise_controller?

  def show
    @user = current_user
  end
end