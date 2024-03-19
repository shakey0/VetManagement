class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        # Here you specify any additional parameters you want to permit for Devise (e.g., for sign up and account updating)
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone, :position])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone, :position])
    end
end
