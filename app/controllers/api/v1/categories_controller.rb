# -------------------------------------------------------------
# Category API
# -------------------------------------------------------------
class Api::V1::CategoriesController < ApiController
  # -------------------------------------------------------------
  # Tree of categories
  # -------------------------------------------------------------
  def index
    categories = Sap::Category.get_category_tree
    respond_with categories
  end
end
