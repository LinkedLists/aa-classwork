class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      login!(user)
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

  def edit
    @user = User.new
    render :edit
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user
      if @user.update(user_params)
        redirect_to user_url(@user)
      else
        flash.now[:errors] = @user.errors.full_messages
        render :edit
      end
    else
      flash[:errors] = ["User not found"]
      redirect_to new_user_url #fix redirect later
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end 

end
