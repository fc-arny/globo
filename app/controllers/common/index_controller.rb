
  # -------------------------------------------------------------
  # Show base or static pages
  # -------------------------------------------------------------
  class Common::IndexController < ApplicationController
    layout :set_layout
    # -------------------------------------------------------------
    # Show main page
    # -------------------------------------------------------------
    def main
      @stores = Sap::Store.active
    end

    # -------------------------------------------------------------
    # When javascript or/and cookie disabled
    # -------------------------------------------------------------
    def badbrowser

    end

    private
      # -------------------------------------------------------------
      # Set layout by action
      # -------------------------------------------------------------
      def set_layout
        case action_name
          when 'badbrowser'
            'badbrowser'
          else
            'base'
        end
      end
  end

