# -------------------------------------------------------------
# =Name: Sap::Manager
# =Description:
# Store's Manager
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   26.11.2012
# -------------------------------------------------------------
# ==Fields:
# store_id - reference to store
# user_id  - reference to base user model
# -------------------------------------------------------------
class Sap::Manager < User
	attr_accessible :first_name, :last_name, :store_id, :user_id
end
