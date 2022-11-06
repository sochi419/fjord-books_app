# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:post_code])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:address])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:self_introduction])
    devise_parameter_sanitizer.permit(:account_update, keys: [:post_code])
    devise_parameter_sanitizer.permit(:account_update, keys: [:address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:self_introduction])
  end
end
