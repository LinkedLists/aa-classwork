class UsersController < ApplicationController
  def create
    @user = User.new(params[:user][:user_name], params[:user][:password])

    if @user.save
      #after user.save login the user
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

end
