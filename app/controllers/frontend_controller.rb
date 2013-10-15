# -------------------------------------------------------------
# Base controller for front application
# -------------------------------------------------------------

  class FrontendController < ApplicationController

    before_filter :bootstrap

    layout 'application_with_basket'

    private

    # -------------------------------------------------------------
    # Fetch stores, categories, order, order items and
    # other needle data
    # -------------------------------------------------------------
    def bootstrap
      # TODO: Cache it!
      # Set up current order
      @order = session[:order_id] ? Sap::Order.find(session[:order_id]) : nil

      ## Data for backbone
      @stores = Sap::Store.active
      @categories = Sap::Category.select('id, url, name')
    end

  end

