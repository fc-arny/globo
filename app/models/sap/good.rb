# -------------------------------------------------------------
# =Name: Sap::Good
# =Description:
# Common good list for all stores
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   20.11.2012
# -------------------------------------------------------------
# ==Fields:
# is_approved - new item entered by a store manager isn't show by default
# status      - state of object (:deleted, :fake and etc)
# -------------------------------------------------------------
class Sap::Good < SapModel

  attr_accessible :description, :id, :is_approved, :name, :status
  has_many :sap_good_lists, :class_name => 'Sap::GoodList'

	# -------------------------------------------------------------
	# =Name: get_good_list
	# =Author: fc_arny
	# -------------------------------------------------------------
	# =Description:
  # Get list of goods by store
	# -------------------------------------------------------------
	def get_good_list(store = nil, category = nil)
		 self.find_all
	end
end
