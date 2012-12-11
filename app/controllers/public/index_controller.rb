  # -------------------------------------------------------------
# =Name: Public::Index
# =Description:
# Show base or static pages
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   23.11.2012
# -------------------------------------------------------------

class Public::IndexController < ApplicationController
  # -------------------------------------------------------------
  # =Name: main
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Show main page
  # -------------------------------------------------------------
  def main
    if session[:user_id]
      @user = Sap::User.find(session[:user_id])
      @customer = @user.customer
    end
  end
end
