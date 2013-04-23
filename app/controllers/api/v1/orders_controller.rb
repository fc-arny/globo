# -------------------------------------------------------------
# API controller for working with Order and OrderList models
# -------------------------------------------------------------
class Api::V1::OrdersController < ApiController

  # -------------------------------------------------------------
  # Get order list
  # -------------------------------------------------------------
  def index
    # Fetch order by Id and Hash
    order = Sap::Order.get_by_hash( params[:hash])

    ## Fetch order list
    #goods = Sap::OrderList.get_by_order_id order.id

    respond_with order
  end

  # -------------------------------------------------------------
  # Create order
  # -------------------------------------------------------------
  def create
    if session[:order_id]
      order = Sap::Order.find(session[:order_id])
    else
      order = Sap::Order.new
      order.state = 'new'
      order.user_id   = current_user ? current_user.id : nil
      order.hash_str  = ApplicationHelper::get_random_string(6)
      order.save!

      # Save order id in session
      session[:order_id] = order.id
    end

    respond_with order
  end

  # -------------------------------------------------------------
  # Add good to order
  # -------------------------------------------------------------
  def add_good

  end

  # -------------------------------------------------------------
  #
  # -------------------------------------------------------------
  def show
    render :json => 1
  end
end