# -------------------------------------------------------------
# Application controller
# -------------------------------------------------------------
class ApplicationController < ActionController::Base

  after_filter :flash_to_headers

  # Include helpers
  include Sap::Core::ControllerHelpers::Common

  # CSRF protection
  protect_from_forgery

  unless config.consider_all_requests_local
    #rescue_from Exception, :with => :render_error
    #rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
    #rescue_from ActionController::RoutingError, :with => :render_not_found
    #rescue_from ActionController::UnknownController, :with => :render_not_found
    #rescue_from ActionController::UnknownAction, :with => :render_not_found
  end


  # Flash message at headers
  def flash_to_headers
    return unless request.xhr?

    message = ''
    message_type = :error

    [:error, :warning, :notice, :success].each do |type|
      unless flash[type].blank?
        message = flash[type]
        message_type = type

      end
    end

    unless message.blank?
      response.headers['X-Message'] = URI::encode message
      response.headers['X-Message-Type'] = message_type
      flash.discard
    end
  end

end