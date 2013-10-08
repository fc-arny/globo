class Store::IndexController < FrontendController
  # Stores list
  def index
    @stores = Sap::Store.active
  end

  # View store
  def show
    @store = Sap::Store.where(:url => params[:url]).first
  end
end
