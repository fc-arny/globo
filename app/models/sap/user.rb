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
# role_id   - role type: Admin, Manager and Customer
# -------------------------------------------------------------
class Sap::User < SapModel

  attr_accessible :id, :login, :password, :salt

  # -------------------------------------------------------------
  # =Name: set_password
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Generate salt and set password
  # -------------------------------------------------------------
  def set_password (password)
    self.salt = ApplicationHelper::get_random_string
    self.password = hash_password(password)
  end

  # -------------------------------------------------------------
  # =Name: auth_by_password
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Auth user by password
  # -------------------------------------------------------------
  def auth_by_password(password)
    hash = hash_password(password)
    result = ( hash == self.password )
  end

  private

  # -------------------------------------------------------------
  # =Name: hash_password
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Get hash-string for password
  # -------------------------------------------------------------
  def hash_password(password)
    Digest::MD5.hexdigest( Digest::MD5.hexdigest(password) + self.salt )
  end
end
