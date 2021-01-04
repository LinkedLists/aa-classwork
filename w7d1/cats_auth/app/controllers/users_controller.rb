class UsersController < ApplicationController
  def create
    @user = User.new(params[:user][:user_name], params[:user][:password])

    if @user.save
  end
end
