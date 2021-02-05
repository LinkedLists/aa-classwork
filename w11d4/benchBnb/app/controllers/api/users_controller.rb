class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token 
  def create
    @user = User.new(params.require(:user).permit(:username, :password))

    if @user.save!
      login!(@user) #(in application controller)
      render :show
    else
      render json: ["Username exists or password is too short"], status: 404
    end
  end

  def show
    @user = User.find_by(params[:id])
    render :show
  end 

  # def index
  #   @users = User.all
  #   render :index
  # end

end
