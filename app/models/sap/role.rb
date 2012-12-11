# -------------------------------------------------------------
# =Name: Roles
# =Description:
# User roles
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   04.12.2012
# -------------------------------------------------------------
# ==Fields:
# class - role class
# -------------------------------------------------------------
class Sap::Role < SapModel
  # Roles class
  R_ADMIN = 'SapAdmin'
  R_MANAGER = 'SapManager'
  R_CUSTOMER = 'SapCustomer'

  attr_accessible :id, :class_name
end

