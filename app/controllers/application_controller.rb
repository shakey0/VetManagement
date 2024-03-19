class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :phone, :position, :password, :password_confirmation, :is_admin])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :phone, :position, :password, :password_confirmation, :is_admin])
    end
end
