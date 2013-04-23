# -------------------------------------------------------------
# Stores' goods
# -------------------------------------------------------------
# ==Fields:
# good_id       - link to Sap::Good
# order_pos     - for sorting
# price         - product's price
# store_id      - link to store
# -------------------------------------------------------------
class Sap::GoodItem < SapModel
  # Fields
  attr_accessible :good_id, :id, :order_pos, :price, :store_id

  # Relationships
  belongs_to :good, :class_name => 'Sap::Good'
  belongs_to :store, :class_name => 'Sap::Store'
  has_many   :order_items, :class_name => 'Sap::OrderItem'
end
