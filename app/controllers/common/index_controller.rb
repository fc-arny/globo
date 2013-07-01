
  # -------------------------------------------------------------
  # Show base or static pages
  # -------------------------------------------------------------
  class Common::IndexController < ApplicationController
    layout 'base'
    # -------------------------------------------------------------
    # Show main page
    # -------------------------------------------------------------
    def main
      @stores = Sap::Store.get_store_list
    end
  end

