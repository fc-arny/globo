# -------------------------------------------------------------
# 
# -------------------------------------------------------------
module Common::BasketHelper
  # -------------------------------------------------------------
  # Render basket
  # -------------------------------------------------------------
  def basket_sidebar(order)

    sum = 0

    unless order.nil?
      order.order_items.inject(0) do |sum,item|
        sum + (item.value*item.good_item.price).to_f
      end
    end

    render :partial => 'partials/common/basket', :locals => {:order => order, :sum => number_to_currency(sum)}
  end

end