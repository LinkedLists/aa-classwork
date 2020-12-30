class UsersController < ApplicationController
  def index
    # render plain: 'Hi'
    render json: User.all
  end

 # app/controller/users_controller.rb
  def create
    user = User.new(params.require(:user).permit(:name, :email))
    # replace the `user_attributes_here` with the actual attribute keys
    # user.save!
    # render json: user


    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: : 422
    end
  end
  
  def show
    # render json: params
    # user = User.find(params[:id])
    render json: User.find(params[:id])
  end

  


end