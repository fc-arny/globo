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
      flash[:alert] = 'You are already logged in. Please Log out.'
      redirect_to root_path
    end

    @form = LoginForm.new
  end

  # -------------------------------------------------------------
  # Login user
  # POST /login
  # -------------------------------------------------------------
  def do_login
    @form = LoginForm.new params[:login_form]

    login     = params[:login_form][:login]
    password  = params[:login_form][:password]

    if @form.valid?
      @user = Sap::User.find_by_login(login)
      if @user && @user.auth_by_password(password)
        # Set session if auth is success
        session[:user_id] = @user.id

        flash[:success] = 'Success Logging'
        redirect_to root_path
      else
        @form.password = nil

        flash.now[:error] = 'Wrong login and/or password'
        render "form"
      end
    else
      flash.now[:error] = 'Errors!PLease input valid data'
      render "form"
    end
  end
end