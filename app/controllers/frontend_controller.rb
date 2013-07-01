# -------------------------------------------------------------
# Base controller for front application
# -------------------------------------------------------------

  class FrontendController < ApplicationController

    before_filter :fetch_store_data

    layout 'application_with_basket'

    private

    # -------------------------------------------------------------
    # Fetch stores, categories, order, order items and
    # other needle data
    # -------------------------------------------------------------
    def fetch_store_data
      # Set up current order
      #@order = session[:order_id] ? Sap::Order.find(session[:order_id]) : nil
      #
      ## Data for backbone
      #@stores = Sap::Store.select('id, name, url')
      #@categories = Sap::Category.select('id, url, name')
    end

  end

