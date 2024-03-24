class CustomRegistrationsController < Devise::RegistrationsController
	before_action :ensure_admin!, except: [:cancel]
	skip_before_action :require_no_authentication, only: [:new, :create], if: :admin_signed_in?

	protected

	def sign_up(resource_name, resource)
		flash[:notice] = "Account for #{resource.first_name} #{resource.last_name} created."
	end

	def ensure_admin!
		unless current_user&.is_admin?
			flash[:alert] = "Only admins are authorized to access this page."
			redirect_to(root_path) and return
		end
	end

	# Define a method to check if an admin is signed in
	# This is used to conditionally skip the require_no_authentication filter
	def admin_signed_in?
		user_signed_in? && current_user.is_admin?
	end
end
