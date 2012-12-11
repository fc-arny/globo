class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_category_tree

  protected

  # -------------------------------------------------------------
  # =Name: set_category_tree
  # =Author: fc_arny
  # -------------------------------------------------------------
  #
  # -------------------------------------------------------------
  def set_category_tree
    @categoryTree = Sap::Category.get_category_tree
    @stores = Sap::Store.all
  end
end
