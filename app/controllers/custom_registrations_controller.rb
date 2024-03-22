class CustomRegistrationsController < Devise::RegistrationsController
	before_action :ensure_admin!

	protected

	def ensure_admin!
		unless current_user&.is_admin?
			flash[:alert] = "Only admins are authorized to access this page."
			redirect_to(root_path) and return
		end
	end
end