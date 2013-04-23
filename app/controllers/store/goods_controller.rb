# -------------------------------------------------------------
# Goods & Categories
# -------------------------------------------------------------

class Store::GoodsController < ApplicationController

  # -------------------------------------------------------------
  # SPA for goods
  # -------------------------------------------------------------
  def index
    store_url = params[:store]

    # Redirect to current store
    if store_url.nil?
      return redirect_to goods_path + '/' + @current_store.url
    end

    # Set up current store
    store = Sap::Store.find_by_url(store_url)
    session[:store_id] = store.id

    # Set up current order
    @order = session[:order_id] ? Sap::Order.find(session[:order_id]) : nil

    # Data for backbone
    @stores = Sap::Store.select('id, name, url')
    @categories = Sap::Category.select('id, url, name')

    # JSON respond is empty. Need for setting up current store
    respond_to do |format|
      format.html
      format.json{ render :json => '' }
    end
  end
end
