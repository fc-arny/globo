# -------------------------------------------------------------
# Regions
# -------------------------------------------------------------
# ==Fields:
# name        - region name
# state       - is active or in progress
# description - some notes
# -------------------------------------------------------------

class Sap::Region < SapModel
  attr_accessible :id, :name, :state, :description
end
