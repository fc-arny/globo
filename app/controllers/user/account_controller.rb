# -------------------------------------------------------------
# Account managment section
# -------------------------------------------------------------
class User::AccountController < FrontendController

  before_action :authenticate_user!
  before_action :prepare

  #  Profile
  def index
    @title = t('account.title.page_edit_account')
    @page = :account
  end

  # Customer's favorites - goods, posts, recipes
  #def favorites
  #  @title = t('account.title.page_favorites')
  #  @page = :favorites
  #  render :index
  #end

  # Customer's orders
  def orders
    @title = t('account.title.page_orders')
    @page = :orders
    render :index
  end

  private

  # Prepare
  def prepare
    @forms = {
      private:  Sap::Account::PrivateForm.new(current_user.attributes),
      password: Sap::Account::ChangePasswordForm.new
    }
  end
end
