# -------------------------------------------------------------
# =Name: ApplicationController
# =Description:
# Base controller for all controllers
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   09.01.2013
# -------------------------------------------------------------
#require "perms"

class ApplicationController < ActionController::Base

  # Check access
  include Perms::Resource

  # CSRF protection
  protect_from_forgery

  before_filter :set_category_tree
  helper_method :current_user

  protected

  # -------------------------------------------------------------
  # =Name: current_user
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Current user or nil
  # -------------------------------------------------------------
  def current_user
    @current_user ||= Sap::User.find(session[:user_id]) if session[:user_id]
  end

  # -------------------------------------------------------------
  # =Name: set_category_tree
  # =Author: fc_arny
  # -------------------------------------------------------------
  # @todo: Move to helper
  # -------------------------------------------------------------
  def set_category_tree
    @categoryTree = Sap::Category.get_category_tree
    @stores = Sap::Store.all
  end
end
