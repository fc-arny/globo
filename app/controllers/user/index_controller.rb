# -------------------------------------------------------------
# Users' module
# -------------------------------------------------------------
class User::IndexController < ApplicationController

  # -------------------------------------------------------------
  # New password form
  # GET /password
  # -------------------------------------------------------------
  def password
    @token = params[:token]
    @user = Sap::User.where('token = ? AND valid_token_to > ?',  @token, Time.now.utc).first
  end

  # -------------------------------------------------------------
  #
  # -------------------------------------------------------------
  def password_save
    # Save password after reset
    if params[:token]
       user = Sap::User.get_user_by_valid_token(params[:token])
    end
  end

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
  # Create token for creating new password and send to email
  # -------------------------------------------------------------
  def password_reset
    @user = Sap::User.find_by_login(params[:login])

    if @user.nil?
      flash[:alert] = "User with login '#{params[:login]}' not found"
      redirect_to password_path
    else
      # Generate token and send email
      @user.token = Sap::User.generate_token(@user)
      @user.valid_token_to = 1.day.from_now
      @user.save

      redirect_to password_reset_sent_path
    end
  end

  # -------------------------------------------------------------
  # Request sent
  # -------------------------------------------------------------
  def password_reset_sent
  end

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
end
