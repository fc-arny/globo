# -------------------------------------------------------------
# Backend for basket
# -------------------------------------------------------------
class Store::OrderController < ApplicationController
  # -------------------------------------------------------------
  # Start order process
  # -------------------------------------------------------------
  def index
    @login_form     = LoginForm.new
    @register_form  = RegisterForm.new
    @contact_form   = UserContactForm.new
    @delivery_form  = OrderDeliveryForm.new
  end

  # -------------------------------------------------------------
  # Return order
  # -------------------------------------------------------------
  def show

  end
end