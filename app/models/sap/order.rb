# -------------------------------------------------------------
# Total order
# == Fields:
# :state    - new, paid etx state of order
# :sum      - total order sum
# :user_id  - user ID
# -------------------------------------------------------------
class Sap::Order < ActiveRecord::Base
  attr_accessible :id, :state, :sum, :user_id
end
