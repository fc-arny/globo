# -------------------------------------------------------------
# =Name: User::Index
# =Description:
# Users' module
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   
# -------------------------------------------------------------

class User::IndexController < ApplicationController
  def index
  end

  # -------------------------------------------------------------
  # =Name: login
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Login user
  # POST /login
  # -------------------------------------------------------------
  def login
    user_params = params[:sap_user]
    @user = Sap::User.find_by_login(user_params[:login])

    if @user && @user.auth_by_password(user_params[:password])
      # Set session if auth is success
      session[:user_id] = @user.id

      flash[:notice] = 'Success Logging'
      redirect_to "/"
    else
      @user = Sap::User.new do |u|
        u.login = user_params[:login]
      end

      flash.now.alert = 'Wrong login or password'
      render "login_form"
    end

  end

  # -------------------------------------------------------------
  # =Name: login_form
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Login form
  # GET /login
  # -------------------------------------------------------------
  def login_form
    @user = session[:user_id] ?
        Sap::User.find(session[:user_id]) : Sap::User.new
  end

  # -------------------------------------------------------------
  # =Name: new
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Register form for customer
  # GET /register
  # -------------------------------------------------------------
  def register_form
    @user = session[:user_id] ?
        Sap::User.find(session[:user_id]) : Sap::User.new
  end

  # -------------------------------------------------------------
  # =Name: password
  # =Author: fc_arny
  # -------------------------------------------------------------
  # New password form
  # GET /password
  # -------------------------------------------------------------
  def password
    @token = params[:token]
    @user = Sap::User.find_by_token(@token)
  end

  # -------------------------------------------------------------
  # =Name: password_create
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Create password
  # -------------------------------------------------------------
  def password_create
    errors = []

    pass = params[:password]
    pass2 = params[:password_confirm]

    if pass != pass
        errors << 'Password are not equal'
    end

    # Getting user by token
    user = Sap::User.find_by_token(params[:token])

    if user == nil && (user.valid_token_to == nil || user.valid_token_to < Time.now)
      errors << 'Your token is expired'
    end

    # Set new password and set null token
    user.password = user.hash_password( pass )
    user.token = nil
    user.valid_token_to = nil

    if user.save
      respond_to do |format|
        format.js{ render json:{:errors => errors}}
      end
    else

    end

  end

  # -------------------------------------------------------------
  # =Name: password_reset
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Create token for creating new password and send to email
  # -------------------------------------------------------------
  def password_reset
    @user = Sap::User.find_by_login(params[:login])

    if @user.nil?
      flash[:alert] = "User with login '#{params[:login]}' not found"
      redirect_to password_path
    else
      # Generate token and send email
      redirect_to password_reset_sent_path
    end


  end

  # -------------------------------------------------------------
  # =Name: password_reset_sent
  # =Author: fc_arny
  # -------------------------------------------------------------
  #
  # -------------------------------------------------------------
  def password_reset_sent
  end

  # -------------------------------------------------------------
  # =Name: create
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Create new customer and user. Link user and customer
  # POST /register
  # -------------------------------------------------------------
  def create
    # Generate random password for new user
    password = ApplicationHelper::get_random_string

    # Create customer
    @customer = Sap::Customer.new do |customer|

      # Create user
      customer.user = Sap::User.new do |user|

        # Email is login for customer
        user.login = customer.email = params[:user][:login]
        user.name  = params[:user][:name]

        # Set Random password and Salt
        user.salt = ApplicationHelper::get_random_string
        user.password = user.hash_password(password)

        user.token = Digest::SHA1.hexdigest( user.name + user.salt + user.password )
      end
    end

    if @customer.save

      # Auth new user
      session[:user_id] = @customer.user.id

      #  Send email
      UserMailer.new_customer(@customer).deliver

      respond_to do |format|
        format.js { render json: { notice: 'Success!User created!' } }
      end
    else
        errors = @customer.errors
        respond_to do |format|
          format.json  {render json: {notice: 'Failed! Please try again!', error: errors} }
          #    format.html{ render 'new' }
        end
    end
  end

  # -------------------------------------------------------------
  # =Name: logout
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Logout user
  # -------------------------------------------------------------
  def logout
    session[:user_id] = nil
    redirect_to root_path, :notice => 'Log out'
  end
end
