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
  # -------------------------------------------------------------
  def login

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
          u.set_password(params[:user][:password])
          u.type = Sap::User::TYPE_CUSTOMER
          u.save
        end

        # Link user and customer
        @customer.user_id = user.id
        @customer.save

        # Success registration
        flash[:notice] = "Success"
        render "new"
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

  end
end
