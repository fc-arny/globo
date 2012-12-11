# -------------------------------------------------------------
# =Name: Sap::GoodList
# =Description:
# Stores' goods
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   11.12.2012
# -------------------------------------------------------------
# ==Fields:
# good_id       - link to Sap::Good
# order_pos     - for sorting
# price         - product's price
# store_id      - link to store
# -------------------------------------------------------------
class Sap::GoodList < SapModel
  attr_accessible :good_id, :id, :order_pos, :price, :store_id

  belongs_to :sap_good, :class_name => 'Sap::Good', :foreign_key => "good_id"
  belongs_to :sap_store, :class_name => 'Sap::Store',:foreign_key => "store_id"
end
