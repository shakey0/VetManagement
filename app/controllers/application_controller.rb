class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :require_login, unless: :devise_controller?
    before_action :require_admin_for_signup, if: :devise_controller?

    private
  
    def require_login
      unless current_user
        redirect_to new_user_session_path, alert: "You must be logged in to access this page."
      end
    end

    def require_admin_for_signup
      if controller_name == 'registrations' && !current_user.try(:is_admin?)
        redirect_to root_path, alert: "Only admins can access this page."
      end
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :phone, :position, :password, :password_confirmation, :is_admin])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :phone, :position, :password, :password_confirmation, :is_admin])
    end
end
