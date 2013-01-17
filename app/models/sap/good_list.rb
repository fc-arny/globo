# -------------------------------------------------------------
# Stores' goods
# -------------------------------------------------------------
# ==Fields:
# good_id       - link to Sap::Good
# order_pos     - for sorting
# price         - product's price
# store_id      - link to store
# -------------------------------------------------------------
class Sap::GoodList < SapModel
  # Fields
  attr_accessible :good_id, :id, :order_pos, :price, :store_id

  # Relationships
  belongs_to :good, :class_name => 'Sap::Good', :foreign_key => "good_id"
  belongs_to :store, :class_name => 'Sap::Store',:foreign_key => "store_id"
end
