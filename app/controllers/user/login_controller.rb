# All login actions
class User::LoginController < FrontendController

  # Login form
  # GET /login
  def form
    @form = Sap::AuthForm.new
    if request.xhr?
      render partial: 'partials/popups/welcome'
    end
  end
end