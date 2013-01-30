# -------------------------------------------------------------
# Categories for goods. We have two-level categorization!
#
# @example
#   Alcohol
#     |_ Bear
#     |_ Wine
#     |_Cocktail
#     |...
#     - no more subcategory for Bear, Wine or Cocktail
# -------------------------------------------------------------
# ==Fields:
# name      - category name
# order_pos - sort for categories
# parent_id - parent category
# url       - category url
# -------------------------------------------------------------

class Sap::Category < SapModel
  # Fields
  attr_accessible :id, :name, :url, :order_pos, :parent_id

  # Association
  has_many :goods, :class_name => 'Sap::Good', :through => :category_goods
  has_many :category_goods, :class_name => 'Sap::CategoryGood'

  class << self

    # -------------------------------------------------------------
    # Find child in deep
    # -------------------------------------------------------------
    def find_child_in_deep(categories, deep = 0, parent = nil)

      _deep = 0
      _parent = parent
      _categories = categories
      cur_category = nil

      # Cycle while current deep >= finding deep
      while _deep <= deep do

        # Break if parent not fount
        if _categories.size == 1
          cur_category = _categories[0]
          break
        end

        # Search category with parent_id = current parent category
        cur_category = _categories.select do |cat|
          # Set current parent category = found category and current deep = current deep + 1
          cat.parent_id == _parent
        end

        # Unset found category
        _categories.delete(cur_category)

        # Increment deep and change parent to found category
        _deep += 1
        _parent = cur_category.first ? cur_category.first.id : nil
      end

      # Return round category
      cur_category
    end

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
      tree
    end
  end
end
