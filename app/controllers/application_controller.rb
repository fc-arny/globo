# Base controller for all controllers
class ApplicationController < ActionController::Base

  # Check access
  include Perms::Resource

  # CSRF protection
  protect_from_forgery

  helper_method :current_user, :user

  before_filter :current_store

  unless config.consider_all_requests_local
    #rescue_from Exception, :with => :render_error
    #rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
    #rescue_from ActionController::RoutingError, :with => :render_not_found
    #rescue_from ActionController::UnknownController, :with => :render_not_found
    #rescue_from ActionController::UnknownAction, :with => :render_not_found
  end

  protected

  # -------------------------------------------------------------
  # Getting current store or return default value
  # -------------------------------------------------------------
  def current_store
    @current_store = session[:current_store].nil? ? Sap::Store.first : Sap::Store.find(session[:current_store])
    session[:current_store] = @current_store.id
  end

  # -------------------------------------------------------------
  # Current user or nil
  # @return [Sap::User, nil]
  # -------------------------------------------------------------
  def current_user
    @current_user ||= Sap::User.find(session[:user_id]) if session[:user_id]
  end
end
