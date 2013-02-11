# -------------------------------------------------------------
# Goods & Categories
# -------------------------------------------------------------

class Store::GoodsController < ApplicationController
  layout 'main_right'

  # -------------------------------------------------------------
  # Show top offers
  # -------------------------------------------------------------
  def index
    @goods = Sap::Good.all
  end

  # -------------------------------------------------------------
  # Return angular templates
  # -------------------------------------------------------------
  def view
    template = params[:template]
    render :file => "store/goods/templates/#{template}", :layout => false
  end

  # -------------------------------------------------------------
  # Search products
  # -------------------------------------------------------------
  def search

  end

  # -------------------------------------------------------------
  # View goods by category
  # -------------------------------------------------------------
  def category
    @p = params[:category]
  end
end
