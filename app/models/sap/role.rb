# -------------------------------------------------------------
# =Name: Roles
# =Description:
# User roles
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   04.12.2012
# -------------------------------------------------------------
# ==Fields:
# class_name - role class
# -------------------------------------------------------------
class Sap::Role < SapModel
  # Roles class
  R_ADMIN = 'SapAdmin'
  R_MANAGER = 'SapManager'
  R_CUSTOMER = 'SapCustomer'

  # Fields
  attr_accessible :id, :class_name

  # Relationships
  has_many :user, :class_name => 'Sap::User'
end


