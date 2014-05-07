# -------------------------------------------------------------
# Goods & Categories
# -------------------------------------------------------------
class Store::GoodsController < FrontendController

  def index
    _curl = params[:category]

    @category = Sap::Category.where(url: _curl).first
    @children = @category ? @category.children : nil

    # JSON respond is empty. Need for setting up current store
    respond_to do |format|
      format.html
      format.json{ render :json => '' }
    end
  end

  def show

  end
end
