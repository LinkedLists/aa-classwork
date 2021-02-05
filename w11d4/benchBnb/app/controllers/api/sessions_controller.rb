class Api::SessionsController < ApplicationController
  before_action :require_logged_in!, only: [:destroy]

  # def new
  #   render :new
  # end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login!(@user)
      redirect_to users_url
    else
      render json: ["User not found"], status: 404
    end
  end

  def destroy
    if logout!
      render json: { }
    else
      render json: ["Can't logout"], status: 404
    end
  end
end
