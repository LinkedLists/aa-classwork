class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    users = User.new
  end
end