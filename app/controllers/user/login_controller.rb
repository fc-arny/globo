# -------------------------------------------------------------
# All login actions
# -------------------------------------------------------------
class User::LoginController < ApplicationController

  layout 'application-without-leftside'

  # -------------------------------------------------------------
  # Login form
  # GET /login
  # -------------------------------------------------------------
  def form
    # Redirect if logged in
    if !current_user.nil?
      flash[:alert] = t('You are already logged in. Please Log out.')
      redirect_to root_path
    end

    @form = LoginForm.new
  end

end