# -------------------------------------------------------------
# Total order
# == Fields:
# :id       - order ID
# :hash_str - for identification
# :state    - new, paid etx state of order
# :sum      - total order sum
# :user_id  - user ID
# -------------------------------------------------------------
class Sap::Order < SapModel
  attr_accessible :id, :state, :sum, :user_id, :hash_str
end
