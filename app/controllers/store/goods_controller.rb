# -------------------------------------------------------------
# Goods & Categories
# -------------------------------------------------------------

class Store::GoodsController < ApplicationController

  # -------------------------------------------------------------
  # Show top offers
  # -------------------------------------------------------------
  def index
    @store = params[:store]
    #if store.nil?
    #  store = Sap::Store.first
    #  redirect_to "/goods/#{store.url}"
    #end
    # Get data for initialize backbone-app
    @goods = Sap::Good.all
    @categories = Sap::Category.select('id, url, name')
  end
end
