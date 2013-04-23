# -------------------------------------------------------------
# Order's goods
# -------------------------------------------------------------
class Api::V1::OrderItemsController < ApiController

  # Group params
  wrap_parameters :item, :include => [:count]

  # -------------------------------------------------------------
  # Update order item
  # -------------------------------------------------------------
  def update
    order_item = Sap::OrderItem.find(params[:id])
    if params[:item][:count] == 0
      order_item.delete
      return
    else
      order_item.update_attributes(params[:item])
    end

    render_jsend :success => order_item
  end

  # -------------------------------------------------------------
  #
  # -------------------------------------------------------------
  def create

  end
end