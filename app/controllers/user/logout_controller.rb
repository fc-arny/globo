
  # -------------------------------------------------------------
  # Logout controller
  # -------------------------------------------------------------
  class User::LogoutController < ApplicationController
    # -------------------------------------------------------------
    # Logout user
    # -------------------------------------------------------------
    def logout
      session[:user_id] = nil
      # TODO: Delete order id from session
      flash[:success]   = 'You are logged out now.'

      redirect_to root_path
    end
  end
