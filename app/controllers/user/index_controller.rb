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
    @customer = Sap::Customer.new
  end

  # -------------------------------------------------------------
  # =Name: create
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Create new customer and user. Link user and customer
  # POST /register
  # -------------------------------------------------------------
  def create
    begin
      ActiveRecord::Base.transaction  do
        @customer = Sap::Customer.new(params[:customer  ])

        # Create user
        user = Sap::User.new do |u|
          u.login = @customer.email
          u.name = @customer.name
          u.set_password(params[:user][:password])
          #u.role_id = Sap::Role.find_by_class_name(Sap::Role::R_CUSTOMER)
          u.save
        end

        # Link user and customer
        @customer.user_id = user.id
        @customer.save

        # Success registration
        flash[:notice] = "Success"
        redirect_to "/"
      end
    rescue => e
      # Failed registration
      flash[:notice] = e.message
      render "new"
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
    redirect_to '/', :notice => 'Log out'
  end
end
