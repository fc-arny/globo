# -------------------------------------------------------------
# Logout controller
# -------------------------------------------------------------
class User::LogoutController < ApplicationController

  # Logout user
  def logout
    sign_out :user
    flash[:success]   = t('sap.api.user.message.log_out')

    redirect_to root_path
  end

end
