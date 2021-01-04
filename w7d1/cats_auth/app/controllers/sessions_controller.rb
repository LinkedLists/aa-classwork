class SessionsController < ApplicationController
    def new ##just renders the form to sign in to a user's account
        @user = User.new
        render :new
    end

    def create ##creates a new session 
        @user = User.new(params[:user][:user_name], params[:user][:password])

    if @user.save
        #after user.save login the user
        redirect_to cats_url
    else
        render :new
    end
  end


end
