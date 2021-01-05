class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      #after user.save login the user
      redirect_to user_url(@user)
    else
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])

    render :show
  end

  def new
    @user = User.new
    render :new
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end

end
