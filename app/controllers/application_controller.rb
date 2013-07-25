# -------------------------------------------------------------
# Application controller
# -------------------------------------------------------------
class ApplicationController < ActionController::Base

  # Include helpers
  include Sap::Core::ControllerHelpers::Common

  # Check access
  include Perms::Resource

  # CSRF protection
  protect_from_forgery

  unless config.consider_all_requests_local
    #rescue_from Exception, :with => :render_error
    #rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
    #rescue_from ActionController::RoutingError, :with => :render_not_found
    #rescue_from ActionController::UnknownController, :with => :render_not_found
    #rescue_from ActionController::UnknownAction, :with => :render_not_found
  end

end