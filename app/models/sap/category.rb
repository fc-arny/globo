# -------------------------------------------------------------
# =Name: Sap::Category
# =Description:
# Categories for goods. We have two-level categorization!
# ----------
# Example:
# Alcohol
#  |_ Bear
#  |_ Wine
#  |_Cocktail
#  |...
# - no more subcategory for Bear, Wine or Cocktail
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   23.11.2012
# -------------------------------------------------------------
# ==Fields:
# name      - category name
# order_pos - sort for categories
# parent_id - parent category
# -------------------------------------------------------------

class Sap::Category < SapModel
  attr_accessible :id, :name, :order_pos, :parent_id
  class << self
    # -------------------------------------------------------------
    # =Name: get_category_tree
    # =Author: fc_arny
    # -------------------------------------------------------------
    # Getting category tree ordered by order_pos
    # -------------------------------------------------------------
    def get_category_tree
      tree = []
      parent = self.where("parent_id is null").order("order_pos ASC")
      parent.each do |cat|
        # Get children
        children = self.where("parent_id = :pid", {pid: cat.id}).order("order_pos ASC")

        childrenTree = []
        children.each do |child|
          childrenTree << {id: child.id, name: child.name}
        end
        tree << { id: cat.id,name: cat.name, children: childrenTree}
      end
      return tree
    end
  end
end
