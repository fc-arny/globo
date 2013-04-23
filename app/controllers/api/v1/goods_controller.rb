# -------------------------------------------------------------
# API for goods
# -------------------------------------------------------------
class Api::V1::GoodsController < ApiController
  # Group params
  wrap_parameters :good_item, :include => [:store]

  # -------------------------------------------------------------
  # List of goods
  # -------------------------------------------------------------
  def index
    builder = QueryBuilder.new(params)

    data = {
        :goods => builder.relation,
        :info => builder.info
    }

    render_jsend :success => data
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

  class QueryBuilder

    DEFAULT_LIMIT = 3

    attr_accessor :fields, :relation, :info

    # -------------------------------------------------------------
    # Init
    # -------------------------------------------------------------
    def initialize(params)
      @params = params

      # SELECT fields
      @fields = [
          # Goods
          'sap.goods.id',
          'sap.goods.name AS name',

          # Good Items
          'sap.good_items.id AS item_id',
          'sap.good_items.price AS price',
          'sap.good_items.store_id AS store_id',

          # Order Data
      ]

      # Create relation
      @relation = Sap::GoodItem.
        select( @fields.join(',') ).
        joins( {:good => :categories} )

      # Create condition
      parse_params()

      # Set pages count
      @info = {
        :pages => ( @relation.count / DEFAULT_LIMIT.to_f ).ceil,
        :count => @relation.count
      }

      # Pagination
      @limit  = DEFAULT_LIMIT
      @offset = @params[:page].to_i * DEFAULT_LIMIT || 0

      @relation = @relation.limit( @limit ).offset( @offset )

    end

    # -------------------------------------------------------------
    #
    # -------------------------------------------------------------
    def parse_params
      # Set store
      if !@params[:store].nil?
        @relation = @relation.where('sap.good_items.store_id = ?', @params[:store])
      end

      # Set category
      if !@params[:category].nil?
        @relation = @relation.where('sap.categories.id = ?', @params[:category])
      end

    end
  end
end

