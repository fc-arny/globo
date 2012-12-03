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
#  name    - just name
#  user_id - link to user
# -------------------------------------------------------------
class Sap::Customer < ActiveRecord::Base
  belongs_to :sap_user, :class_name => 'Sap::User'
  attr_accessible :email, :name, :user_id
end
