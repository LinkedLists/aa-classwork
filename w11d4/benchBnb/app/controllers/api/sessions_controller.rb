class Api::SessionsController < ApplicationController
  def destroy
    if logout!
    else
      flash.now[:errors] = @user.errors.full_messages
    end
  end
end
