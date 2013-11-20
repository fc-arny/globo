# -------------------------------------------------------------
# Account managment section
# -------------------------------------------------------------
class User::AccountController < FrontendController

  before_action :authenticate_user!

  #  Customer info
  def index
    @main_form = AccountMainForm.new(name: current_user.name)
    @phone_form = AccountPhoneForm.new()
  end

  # -------------------------------------------------------------
  # Customer's favorites - goods, posts, recipes
  # -------------------------------------------------------------
  def favorites

  end

  # -------------------------------------------------------------
  # Customer's orders
  # -------------------------------------------------------------
  def orders

  end

  # -------------------------------------------------------------
  # Customer's addresses
  # -------------------------------------------------------------
  def addresses

  end
end