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
            # update user
        end
    
        private
    
        def set_user
            @user = User.find(params[:id])
        end
    
        def check_admin
            redirect_to(root_url) unless current_user&.is_admin?
        end
    
        # other private methods...
    end
end
