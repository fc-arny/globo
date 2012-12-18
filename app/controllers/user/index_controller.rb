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
        u.login = params[:login]
      end

      flash[:notice] = 'No such user'
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
    if session[:user_id]
      redirect_to root_path
    end
    @user = Sap::User.new
  end

  # -------------------------------------------------------------
  # =Name: new
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Register form for customer
  # GET /register
  # -------------------------------------------------------------
  def new
    if session[:user_id]
      redirect_to root_path, :notice => 'You are already have account. Please log out for creating new account.'
    end
    @customer = Sap::Customer.new
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

    @is_new = @user.valid_token_to == nil ? true : false
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
  # =Name: create
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Create new customer and user. Link user and customer
  # POST /register
  # -------------------------------------------------------------
  def create

      @customer = Sap::Customer.new do |c|
        c.email = params[:customer][:email]
      end

      # Generate random password
      password = ApplicationHelper::get_random_string

      # Create user
      @customer.user = Sap::User.new do |user|
        user.login = @customer.email
        user.name = params[:customer][:user][:name]
        user.role_id = Sap::Role.find_by_class_name(Sap::Role::R_CUSTOMER)

        # Set Random password and Salt
        user.salt = ApplicationHelper::get_random_string
        user.password = user.hash_password(password)

        user.token = Digest::SHA1.hexdigest( user.name + user.salt + user.password )
      end

      notice = ''

      if @customer.save
        notice = 'Success!User created!'

        # Auth new user
        session[:user_id] = @customer.user.id

        #  Send email
        UserMailer.new_customer(@customer).deliver
        respond_to do |format|
          format.js { render json: { notice: notice } }
        end
      else
        notice = 'Failed! Please try again!'

        errors = @customer.errors
        respond_to do |format|
          format.json  {render json: {notice: notice, error: errors} }
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
