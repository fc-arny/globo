# -------------------------------------------------------------
# GloboMarket's administrators
# -------------------------------------------------------------
# ==Fields:
# city_id  - admin by city or global admin if null
# position - position in company
# user_id  - reference to user
# -------------------------------------------------------------
class Sap::Admin < SapModel
  has_one :user, :class_name => 'Sap::User', :as => :role
  attr_accessible :city_id, :position, :user_id
end
