# All login actions
class User::LoginController < FrontendController

  layout 'application_with_basket'

  # Login form
  # GET /login
  def form
    @form = Sap::AuthForm.new
    if request.xhr?
      render :partial => 'partials/popups/welcome'
    end
    # Redirect if logged in
    #if !current_user.nil?
    #  flash[:alert] = t('You are already logged in. Please Log out.')
    #end

    #@form = LoginForm.new
  end

end