# -------------------------------------------------------------
# Backend for basket
# -------------------------------------------------------------
class Store::OrdersController < ApplicationController
  # -------------------------------------------------------------
  # Create order object by AJAX
  # -------------------------------------------------------------
  def create
    if session[:order_id]
      order = Sap::Order.find(session[:order_id])
    else
      order = Sap::Order.new
      order.state = 'new'
      order.user_id   = current_user ? current_user.id : nil
      order.hash_str  = ApplicationHelper::get_random_string(6)
      order.save

      # Save order id in session
      session[:order_id] = order.id
    end

    respond_to do |format|
      format.json{ render :json => "#{order.id}x#{order.hash_str}" }
    end
  end
end