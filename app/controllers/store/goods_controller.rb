# -------------------------------------------------------------
# Goods & Categories
# -------------------------------------------------------------

class Store::GoodsController < ApplicationController

  # -------------------------------------------------------------
  # Show top offers
  # -------------------------------------------------------------
  def index
    store_url = params[:store]
    if store_url.nil?
      redirect_to '/goods/' + @current_store.url
    else
      @stores = Sap::Store.select('id, name, url')
      store = Sap::Store.find_by_url(store_url)
      session[:current_store] = store.id
      @categories = Sap::Category.select('id, url, name')
    end
  end
end
