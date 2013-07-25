# -------------------------------------------------------------
# Goods & Categories
# -------------------------------------------------------------

class Store::GoodsController < FrontendController

  layout 'application_with_basket'

  # -------------------------------------------------------------
  # SPA for goods
  # -------------------------------------------------------------
  def index
    store_url = params[:store]

    # Redirect to current store
    if store_url.nil?
      return redirect_to '/' + @current_store.url
    end

    # Set up current store
    store = Sap::Store.find_by_url(store_url)
    session[:store_id] = store.id

    # JSON respond is empty. Need for setting up current store
    respond_to do |format|
      format.html
      format.json{ render :json => '' }
    end
  end
end
