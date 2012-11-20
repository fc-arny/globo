# -------------------------------------------------------------
# =Name: Sap::Store
# =Description:
# Contain base information about business-clients (for example "Azbuka Vkusa", "Allye Parusa")
# -------------------------------------------------------------
# =Fields:
#  order_pos    - position in store list
#  is_disables  - don't work with the client
# -------------------------------------------------------------
class Sap::Store < ActiveRecord::Base
	attr_accessible :id, :name, :order_pos, :is_disabled
end
