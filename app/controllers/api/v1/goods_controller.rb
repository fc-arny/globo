# -------------------------------------------------------------
# =Name: Api::V01::ProductController
# =Description:
# API for
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:
# -------------------------------------------------------------

class Api::V1::GoodsController < ApplicationController
  # -------------------------------------------------------------
  # =Name: search
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Search goods by params
  # -------------------------------------------------------------
  def search
    condition = []

    raise 'store_id is required' if params[:store_id].nil?

    condition = {:store_id => params[:store_id]}


    # Get all goods
    @goods = Sap::GoodList.
        select('goods.name as good_name, stores.name as store_name, price').
        joins(:good, :store).
        where(condition)

    respond_to do |format|
      format.json{render json: @goods}
    end
  end
end
