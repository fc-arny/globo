# -------------------------------------------------------------
# Buyer model referenced to user
# -------------------------------------------------------------
# ==Fields:
#  email   - login for user
# -------------------------------------------------------------
class Sap::Customer < SapModel
  # Fields
  attr_accessible :email, :role

  # Validators
  #validates :email, :uniqueness => true,
  #                  :length => {:minimum => 3, :maximum => 80},
  #                  :presence => true,
  #                  :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}

  # Relationships
  has_one :user, :class_name => 'Sap::User', :as => :role
end
