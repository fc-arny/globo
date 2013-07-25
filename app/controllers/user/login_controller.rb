# -------------------------------------------------------------
# All login actions
# -------------------------------------------------------------
class User::LoginController < FrontendController

  layout 'application_with_basket'

  # -------------------------------------------------------------
  # Login form
  # GET /login
  # -------------------------------------------------------------
  def form
    # Redirect if logged in
    if !current_user.nil?
      flash[:alert] = t('You are already logged in. Please Log out.')
    end

    @form = LoginForm.new
  end

end