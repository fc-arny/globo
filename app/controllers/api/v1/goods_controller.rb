module Api
  module V1
    # -------------------------------------------------------------
    # API for goods
    # -------------------------------------------------------------
    class GoodsController < ApiController
      # -------------------------------------------------------------
      # Init env
      # -------------------------------------------------------------
      def initialize
        # Using tables
        @table_good      = Sap::Good.table_name
        @table_good_list = Sap::GoodList.table_name

        # alias => field grouped by table
        @select_fields = {
            @table_good => {
                :id   => 'id',
                :name => 'name'
            },
            @table_good_list => {
                :price    => 'price',
                :store_id    => 'store_id'
            }
        }
      end

      # -------------------------------------------------------------
      # List of goods
      # -------------------------------------------------------------
      def index
        query =  build_query(Sap::Good)

        data = Hash.new
        data[:goods] = query.limit(params[:limit]).offset(params[:offset])

        count = query.count
        data[:count] = count
        data[:page_count] = (count.to_f/3).ceil

        respond_with data
      end

      # -------------------------------------------------------------
      # Search goods by params
      # -------------------------------------------------------------
      def search

      end

      # -------------------------------------------------------------
      # Create goods
      # -------------------------------------------------------------
      def create
        #if @task.save
        #  respond_with(@task)
        #else
        #  respond_with(@task, :status => :unprocessable_entity)
        #end

      end

      private

      # -------------------------------------------------------------
      # Generate SELECT for query
      # @return String
      # -------------------------------------------------------------
      def build_query_select

        select = []

        @select_fields.each do |table, fields|
          select << fields.map{|value,field| "#{table}.#{field} as #{value}"}.join(',')
        end

        select.join(',')
      end

      # -------------------------------------------------------------
      #
      # -------------------------------------------------------------
      def build_query_where




      end

      # -------------------------------------------------------------
      # Create QUERY
      # -------------------------------------------------------------
      def build_query(query)
        # Category and store is required for getting goods
        store_id    = params[:store]
        category_id = params[:category]

        query.select(build_query_select).
          joins(:good_list,:category_goods).
          where('store_id = ? AND category_id = ?', store_id, category_id)
      end
    end
  end
end

