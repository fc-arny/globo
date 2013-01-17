# Base controller for all controllers
class ApplicationController < ActionController::Base

  # Check access
  include Perms::Resource

  # CSRF protection
  protect_from_forgery

  before_filter :set_category_tree
  helper_method :current_user

  protected


  # Current user or nil
  # @return [Sap::User, nil]
  def current_user
    @current_user ||= Sap::User.find(session[:user_id]) if session[:user_id]
  end

  # @todo: Move to helper
  def set_category_tree
    @categoryTree = Sap::Category.get_category_tree
    @stores = Sap::Store.all
  end
end
