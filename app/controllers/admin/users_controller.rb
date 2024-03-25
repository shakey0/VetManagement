# app/controllers/admin/users_controller.rb
module Admin
    class UsersController < ApplicationController
        before_action :set_user, only: [:show, :edit, :update]
        before_action :check_admin
    
        def index
            @title = "Staff"
            @user_new_link = true
            @users = User.all
        end

        def show
            @title = "Staff"
            @users_link = true
            @user_new_link = true
        end

        def new
            @title = "Staff"
            @users_link = true
            @user = User.new
        end

        def edit
            @title = "Staff"
            @users_link = true
            @user_new_link = true
        end
    
        def create
            @user = User.new(new_user_params)
            if @user.save
                redirect_to admin_user_path(@user), notice: "Account for #{new_user_params[:first_name]} #{new_user_params[:last_name]} successfully created."
            else
                @title = "Staff"
                @users_link = true
                render :new
            end
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

        def new_user_params
            params.require(:user).permit(:first_name, :last_name, :email, :phone, :position, :is_admin, :password, :password_confirmation)
        end

        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :phone, :position, :is_admin)
        end
    end
end
