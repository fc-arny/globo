# -------------------------------------------------------------
# =Name: Sap::Admin
# =Description:
# GloboMarket's administrator
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   24.11.2012
# -------------------------------------------------------------
# ==Fields:
#  
# -------------------------------------------------------------
class Sap::Admin < Sap::User
  attr_accessible :city_id, :name, :position, :user_id
end
