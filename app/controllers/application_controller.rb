class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    # flash[:error] = "Access denied."
    # redirect_to root_path
    redirect_to root_path, :alert => exception.message
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :name, :email, :role, :avatar, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :name, :email, :role, :avatar, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:login, :username, :name, :email, :role, :avatar, :password, :password_confirmation, :current_password)}
  end
end
