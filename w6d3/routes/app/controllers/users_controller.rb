class UsersController < ApplicationController
  def index
    # render json: User.all
    render plain: 'Hi'
  end

  def create
    # users = User.new
    render json: params
  end
end