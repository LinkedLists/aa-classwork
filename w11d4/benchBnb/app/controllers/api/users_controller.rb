class Api::UsersController < ApplicationController
  
  def create
    @user = User.new(params.require(:user).permit(:username, :password))

    if @user.save!
      # login user (in application controller)
      render json: @user
    end
  end

  def show
    @user = User.find_by(params[:id])
    render json: @user
  end 

  def index
    @users = User.all
    render json: @users
  end

end
