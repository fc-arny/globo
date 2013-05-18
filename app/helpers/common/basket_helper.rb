# -------------------------------------------------------------
# 
# -------------------------------------------------------------
module Common::BasketHelper
  # -------------------------------------------------------------
  #
  # -------------------------------------------------------------
  def basket
    order = session[:order_id] ? Sap::Order.find(session[:order_id]) : nil
    sum = order.order_items.inject(0) do |s,item|
      s + (item.count*item.good_item.price).to_f
    end
    render :partial => 'partials/common/basket', :locals => {:order => order, :sum => number_to_currency(sum)}
  end

end