class ApplicationController < ActionController::Base
	protect_from_forgery
	before_filter :set_locale

	protected

	# Set locale from params
	def set_locale
		I18n.locale = params[:locale] || I18n.default_locale
	end

	# Set locale param by default
	def default_url_options
		{ locale: I18n.locale }
	end
end
