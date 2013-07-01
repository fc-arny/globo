
  # -------------------------------------------------------------
  # Controller for save/remove user settings
  # -------------------------------------------------------------
  class Common::SettingsController < ApplicationController
    include Common::UserHelper
    # -------------------------------------------------------------
    # Set setting for current user
    # -------------------------------------------------------------
    def setup
      set_session_setting(params[:key], params[:value])
      back = defined?(params[:back]) ? params[:back] : root_path
      key,value = params[:key], params[:value]
      respond_to do |format|
        format.html{ redirect_to back }
        format.js{ render :json => {:status => 'ok', :key => key, :value => value, :store => session_setting(key)} }
      end
    end
  end
