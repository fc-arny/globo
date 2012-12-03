# -------------------------------------------------------------
# =Name: Sap::User
# =Description:
# Base model for users
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   24.11.2012
# -------------------------------------------------------------
# ==Fields:
# login     - login string (email for customer)
# password  - secret key = md5(md5(password) + salt)
# salt      - increase secure for password
# type      - role type: Admin, Manager and Customer
# -------------------------------------------------------------
class Sap::User < ActiveRecord::Base
  # User's type
  TYPE_ADMIN = 'Sap::Admin'
  TYPE_MANAGER = 'Sap::Manager'
  TYPE_CUSTOMER = 'Sap::Customer'

  attr_accessible :id, :login, :password, :salt, :type

  # -------------------------------------------------------------
  # =Name: set_password
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Generate salt and set password
  # -------------------------------------------------------------
  def set_password (password)
    self.salt = ApplicationHelper::get_random_string
    self.password = Digest::MD5.hexdigest( Digest::MD5.hexdigest( password ) + self.salt )
  end

  class << self

  end
end
