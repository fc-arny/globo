module Api
  module V1
    # -------------------------------------------------------------
    #
    # -------------------------------------------------------------
    class StoresController < ApplicationController
      # -------------------------------------------------------------
      #
      # -------------------------------------------------------------
      def index
        @list = Sap::Store.
            select('id, name').
            where('1=1')

        respond_to do |format|
          format.json{ render :json => @list}
        end
      end
    end
  end
end