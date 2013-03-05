# -------------------------------------------------------------
# =Name: Sap::Store
# =Description:
# Contain base information about business-clients (for example "Azbuka Vkusa", "Allye Parusa")
# -------------------------------------------------------------
# =Fields:
#  order_pos    - position in store list
#  url          - name in latin for links
#  is_disables  - don't work with the client
#  region_id    - link to region
# -------------------------------------------------------------
class Sap::Store < SapModel
  # Fields
	attr_accessible :id, :name, :url, :order_pos, :region_id

  # -------------------------------------------------------------
  # Get actual store list
  # -------------------------------------------------------------
  def self.get_store_list
    self.all
  end
end
