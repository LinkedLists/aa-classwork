class Api::SessionsController < ApplicationController
  before_action :require_logged_in!, only: [:destroy]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login!(@user)
      redirect_to users_url
    else
      flash[:errors] = ["invalid username or password"]
      render :new
    end
  end

  def destroy
    if logout!
    else
      flash.now[:errors] = @user.errors.full_messages
    end
  end
end
