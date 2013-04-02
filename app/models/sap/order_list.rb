# -------------------------------------------------------------
# Like a "BASKET"
# -------------------------------------------------------------
# ==Fields
# :count    - just count
# :good_id  - link to good list item
# :order_id - link to total order
# -------------------------------------------------------------
class Sap::OrderList < SapModel
  attr_accessible :id, :count, :good_id, :order_id
end
