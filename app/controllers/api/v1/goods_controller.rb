module Api
  module V1
    # -------------------------------------------------------------
    # API for goods
    # -------------------------------------------------------------
    class GoodsController < ApiController
      # -------------------------------------------------------------
      # List of goods
      # -------------------------------------------------------------
      def index
        @goods = Sap::GoodList.
            select('goods.id as good_id,goods.name as good_name, stores.name as store_name, price').
            joins(:good, :store)

        respond_with @goods
      end

      # -------------------------------------------------------------
      # Search goods by params
      # -------------------------------------------------------------
      def search
        sleep 5
        condition = []

        #raise 'store_id is required' if params[:store_id].nil?

        condition = {:store_id => params[:store_id]} if !params[:store_id].nil?

        # Get all goods
        @goods = Sap::GoodList.
            select('goods.id as good_id,goods.name as good_name, stores.name as store_name, price').
            joins(:good, :store).
            where(condition)

        respond_to do |format|
          format.json{render json: @goods}
        end
      end

      private

      # -------------------------------------------------------------
      #
      # -------------------------------------------------------------
      def build_query(query, *params)

      end
    end
  end
end

