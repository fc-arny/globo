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
  end
end