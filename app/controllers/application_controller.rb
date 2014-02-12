# -------------------------------------------------------------
# Application controller
# -------------------------------------------------------------
class ApplicationController < Sap::BaseController

  after_filter :flash_to_headers
  before_filter do
    unless rails_admin_path?
      Rack::MiniProfiler.authorize_request if current_user && !current_user.role.nil?
    end
  end

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

  def render(*args)
    unless redirect_back
      super
    end
  end

  private

  def render_404
    respond_to do |format|
      format.html { render 'common/errors/404', status: 404 }
      format.json { render json: {status: 404, error: 'Page not found'} }
    end
  end

  # Redirect to back url 
  def redirect_back
    if params[:back_url]
      redirect_to params[:back_url]
    end
  end

  def rails_admin_path?
    !(params[:controller] =~ /^rails_admin/).nil?
  end
end