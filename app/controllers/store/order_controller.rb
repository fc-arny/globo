# Backend for basket
class Store::OrderController < FrontendController

  layout 'no_menu'

  # List of order's steps
  def steps
    %w[auth delivery payment]
  end

  def current_step
    @current_step || steps.first
  end

  # Open basket
  def index
    @login_form     = Sap::AuthForm.new
    @register_form  = Sap::NewCustomer.new
    # @contact_form   = CustomerTemporaryForm.new
    # @delivery_form  = OrderDeliveryForm.new
  end

  # View ordered products
  def list
    render partial: 'partials/popups/basket' if request.xhr?
  end
end