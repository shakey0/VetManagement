# app/controllers/admin/users_controller.rb
module Admin
    class UsersController < ApplicationController
        before_action :set_user, only: [:show, :edit, :update]
        before_action :check_admin
    
        def index
            @title = "Users"
            @user_new_link = true
            @users = User.all
        end

        def show
            @title = "Users"
            @users_link = true
            @user_new_link = true
        end

        def new
            @title = "Users"
            @users_link = true
            @user = User.new
        end

        def edit
            @title = "Users"
            @users_link = true
            @user_new_link = true
        end
    
        def create
            @user = User.new(new_user_params)
            respond_to do |format|
                if @user.save
                    format.html { redirect_to admin_user_path(@user), notice: 'User successfully created.' }
                    format.json { render :show, status: :created, location: @user }
                else
                    format.html { render :new, status: :unprocessable_entity }
                    format.json { render json: @user.errors, status: :unprocessable_entity }
                end
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
