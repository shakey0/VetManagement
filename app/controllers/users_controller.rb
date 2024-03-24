class UsersController < ApplicationController
    def create
      @user = User.new(user_params)
      
      if @user.save
        redirect_to admin_user_path(@user)
      else
        render :new
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone, :position, :password, :password_confirmation)
    end
  end
  