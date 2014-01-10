# -------------------------------------------------------------
# Application controller
# -------------------------------------------------------------
class ApplicationController < Sap::BaseController

  after_filter :flash_to_headers

  # Include helpers
  helper :all
  include Sap::Core::ControllerHelpers::Common

  # CSRF protection
  protect_from_forgery

  unless Rails.application.config.consider_all_requests_local
    #rescue_from Exception, :with => :render_error
    rescue_from ActiveRecord::RecordNotFound, :with => :render_404
    rescue_from ActionController::RoutingError, :with => :render_404
    rescue_from ActionView::MissingTemplate, :with => :render_404
    rescue_from ActionController::UnknownController, :with => :render_404
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

  private

  def render_404
    respond_to do |format|
      format.html { render 'common/errors/404', status: 404 }
      format.json { render json: {status: 404, error: 'Page not found'} }
    end
  end

end