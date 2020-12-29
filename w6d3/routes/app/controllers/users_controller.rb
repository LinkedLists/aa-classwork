class UsersController < ApplicationController
  def index
    # render json: User.all
    render plain: 'Hi'
  end

  def create
    # users = User.new
    render json: params
  end
  
  # def show
  #   # user = User.find(params[:id])
  #   render json: User.find(params[:id])
  # end
end