# -------------------------------------------------------------
# Backend for basket
# -------------------------------------------------------------
class Store::OrderController < ApplicationController
  # -------------------------------------------------------------
  # Start order process
  # -------------------------------------------------------------
  def index
    @login_form     = LoginForm.new
    @register_form  = NewCustomerForm.new
    @contact_form   = CustomerTemporaryForm.new
    @delivery_form  = OrderDeliveryForm.new
  end

  # -------------------------------------------------------------
  # Return order
  # -------------------------------------------------------------
  def show

  end
end