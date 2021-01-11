class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to user_url(user) #change later
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end 

end
