# -------------------------------------------------------------
# Goods & Categories
# -------------------------------------------------------------

class Store::GoodsController < ApplicationController
  layout 'main_right'

  # -------------------------------------------------------------
  # Show top offers
  # -------------------------------------------------------------
  def index
    # Get data for initialize backbone-app
    @goods = Sap::Good.all
    @categories = Sap::Category.select('id, url, name')
  end
end
