# -------------------------------------------------------------
# =Name: Sap::Customer
# =Description:
# Buyer model referenced to user
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   26.11.2012
# -------------------------------------------------------------
# ==Fields:
#
# -------------------------------------------------------------
class Sap::Customer < User
	attr_accessible :email, :first_name, :last_name, :user_id
end
