class SessionsController < ApplicationController
  before_action :require_logged_in, only: [:destroy]

  def new
    render :new
  end
  
  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if user
      login!(user)
      redirect_to new_user_url #fix later
    else
      flash[:errors] = ["Invalid credentials"]
      render :new
    end
  end

  def destroy
    logout
  end
end
