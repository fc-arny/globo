# -------------------------------------------------------------
# Sending emails to users
# -------------------------------------------------------------

class UserMailer < ActionMailer::Base
  default from: "noreply@globomarket.ru"

  # -------------------------------------------------------------
  # New customer email
  # -------------------------------------------------------------
  def new_customer(customer)
    @customer = customer
    @token = customer.user.token
    mail(:to => customer.email, :subject => 'Welcome to GloboMarket')
  end

  # -------------------------------------------------------------
  # Email with token for resetting password
  # -------------------------------------------------------------
  def reset_password
  end
end
