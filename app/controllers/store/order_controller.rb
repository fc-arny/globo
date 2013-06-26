# -------------------------------------------------------------
# Backend for basket
# -------------------------------------------------------------
class Store::OrderController < FrontendController

  # -------------------------------------------------------------
  # List of order's steps
  # -------------------------------------------------------------
  def steps
    %w[auth delivery payment]
  end

  # -------------------------------------------------------------
  #
  # -------------------------------------------------------------
  def current_step
    @current_step || steps.first
  end

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
  # View ordered products
  # -------------------------------------------------------------
  def list


  end
end