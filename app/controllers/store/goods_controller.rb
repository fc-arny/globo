# -------------------------------------------------------------
# Goods & Categories
# -------------------------------------------------------------

class Store::GoodsController < FrontendController

  def index
    # Set up current store
    # store = Sap::Store.find_by_url(store_url)
    # session[:store_id] = store.id

    # JSON respond is empty. Need for setting up current store
    respond_to do |format|
      format.html
      format.json{ render :json => '' }
    end
  end
end
