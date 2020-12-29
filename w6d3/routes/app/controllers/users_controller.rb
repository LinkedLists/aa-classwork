class UsersController < ApplicationController
  def index
    render plain: 'Hi'
  end

  def create
    render json: params
  end
  
  def show
    render json: params
    # user = User.find(params[:id])
    # render json: User.find(params[:id])
  end


end