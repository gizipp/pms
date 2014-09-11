class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  validates_uniqueness_of :username

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :username, :email, :role, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:name, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password) }
  end
end
