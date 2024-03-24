# app/controllers/admin/users_controller.rb
module Admin
    class UsersController < ApplicationController
        before_action :set_user, only: [:show, :edit, :update]
        before_action :check_admin
    
        def index
            @users = User.all
        end
    
        def show
            # show a single user
        end
    
        def edit
            # edit user form
        end
    
        def update
            if @user.update(user_params)
                redirect_to admin_user_path(@user), notice: "Details for #{@user.first_name} #{@user.last_name} successfully updated."
            else
                render :edit
            end
        end
    
        private
    
        def set_user
            @user = User.find(params[:id])
        end
    
        def check_admin
            redirect_to(root_url) unless current_user&.is_admin?
        end

        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :phone, :position, :is_admin)
        end
    
        # other private methods...
    end
end
