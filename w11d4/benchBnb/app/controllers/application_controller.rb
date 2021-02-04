class ApplicationController < ActionController::Base
  #CRLLL
  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def require_logged_in
  end

  def login
  end

  def logout
  end

  def logged_in?
  end

end
