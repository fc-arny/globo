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
  end

  # -------------------------------------------------------------
  # Return order
  # -------------------------------------------------------------
  def show

  end
end