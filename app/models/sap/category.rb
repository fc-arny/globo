# -------------------------------------------------------------
# =Name: Category
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

class Sap::Category < ActiveRecord::Base
	attr_accessible :id, :name, :order_pos, :parent_id
end
