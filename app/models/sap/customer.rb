      # -------------------------------------------------------------
# =Name: Sap::Customer
# =Description:
# Buyer model referenced to user
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   26.11.2012
# -------------------------------------------------------------
# ==Fields:
#  email   - login for user
#  user_id - link to user
# -------------------------------------------------------------
class Sap::Customer < SapModel
  # Fields
  attr_accessible :email, :user_id

  # Validators
  validates :email, :uniqueness => true,
                    :length => {:minimum => 3, :maximum => 80},
                    :presence => true,
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}

  # Relationships
  belongs_to :user, :class_name => 'Sap::User', :foreign_key => 'user_id'
end
