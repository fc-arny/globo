# -------------------------------------------------------------
# User routes
# -------------------------------------------------------------
Sap::Application.routes.draw do
  scope :module => 'user' do
    get   '/login' => 'login#form'                 # Login form
    get   '/logout' => 'logout#do_logout'          # Logout

    get   '/register' => 'register#form'           # Register form

    get '/password'  => 'index#password'             # Restore password form
    post '/password'  => 'index#password_create'     # Restore password
    post '/password_reset' => 'index#password_reset' # Generate token for reset
    get '/password_reset_sent' => 'index#password_reset_sent'
  end
end