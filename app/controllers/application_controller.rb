class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  # protect_from_forgery with: :exception
  
  # # Disable CSRF protection for OmniAuth callback route
  # skip_before_action :verify_authenticity_token, only: :omniauth_callback

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number,:department, :role, :date_of_joining, :onboarding_status])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number,:department, :role, :date_of_joining, :onboarding_status])
  end
end


