class UsersController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(params.require(:user).permit(:email,:password))

        if @user.save
            login!(@user) #login method from app. controller
            redirect_to user_url(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
        render :show
    end
end
