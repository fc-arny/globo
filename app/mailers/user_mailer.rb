# -------------------------------------------------------------
# =Name: UserMailer
# =Description:
# Sending emails to users
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   18.12.2012
# -------------------------------------------------------------
class UserMailer < ActionMailer::Base
  default from: "noreply@globomarket.ru"
  # -------------------------------------------------------------
  # =Name: new_customer
  # =Author: fc_arny
  # -------------------------------------------------------------
  # New customer email
  # -------------------------------------------------------------
  def new_customer(customer)
    @customer = customer
    @token = customer.user.token
    mail(:to => customer.email, :subject => 'Welcome to GloboMarket')
  end

  # -------------------------------------------------------------
  # =Name: reset_password
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Email with token for resetting password
  # -------------------------------------------------------------
  def reset_password
  end
end
