# Base controller for all controllers
class ApplicationController < ActionController::Base

  # Check access
  include Perms::Resource

  # CSRF protection
  protect_from_forgery

  helper_method :current_user, :user

  protected

  # -------------------------------------------------------------
  # Current user or nil
  # @return [Sap::User, nil]
  # -------------------------------------------------------------
  def current_user
    @current_user ||= Sap::User.find(session[:user_id]) if session[:user_id]
  end
end
