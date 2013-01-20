module User
  # -------------------------------------------------------------
  # Logout controller
  # -------------------------------------------------------------
  class User::LogoutController < ApplicationController
    # -------------------------------------------------------------
    # Logout user
    # -------------------------------------------------------------
    def do_logout
      session[:user_id] = nil
      flash[:success]   = 'You are logged out now.'

      redirect_to root_path
    end
  end
end