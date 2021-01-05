class SessionsController < ApplicationController
    def new ##just renders the form to sign in to a user's account
        @user = User.new
        render :new
    end

    def create ##creates a new session 
        @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])

        if @user
            #after user.save login the user
            # @user.reset_session_token!
            session[:session_token] = @user.reset_session_token!
            redirect_to cats_url
        else
            render :new
        end
    end

end
