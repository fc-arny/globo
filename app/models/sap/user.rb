# -------------------------------------------------------------
# =Name: Sap::User
# =Description:
# Base model for users
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   24.11.2012
# -------------------------------------------------------------
# ==Fields:
# login     - email or login string
# name      - just name generated from child model
# password  - secret key = md5(md5(password) + salt)
# salt      - increase secure for password
# type      - role type: Admin, Vendor and Buyer
# -------------------------------------------------------------

class Sap::User < ActiveRecord::Base
  attr_accessible :id, :login, :name, :password, :salt, :type
end
