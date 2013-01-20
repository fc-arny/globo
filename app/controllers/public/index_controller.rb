module Public
  # -------------------------------------------------------------
  # Show base or static pages
  # -------------------------------------------------------------
  class IndexController < ApplicationController
    # -------------------------------------------------------------
    # Show main page
    # -------------------------------------------------------------
    def main
      @users = Sap::User.restrict(current_user).order('id DESC')

    end
  end
end
