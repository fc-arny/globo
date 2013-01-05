class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_category_tree
  helper_method :current_user

  protected

  # -------------------------------------------------------------
  # =Name: current_user
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Current uses or nil
  # -------------------------------------------------------------
  def current_user
    @current_user ||= Sap::User.find(session[:user_id]) if session[:user_id]
  end

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
