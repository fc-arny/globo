# -------------------------------------------------------------
# Helper methods for users
# -------------------------------------------------------------
module Common::UserHelper
  # User state helper 
  def user_state(view = 'common')
    @items = [
      {title: t('common.menu.order'), link: ''},
      {title: t('common.menu.settings'), link: account_path},
      {title: t('common.menu.logout'), link: logout_path},
    ]

    render partial: "user/state/items/#{view}"
  end

  # MEnu for account
  def user_account_menu
    @links = [
      {action: :index, title: t('account.link.private_main')},
      {action: :favorites, title: t('account.link.favorites')},
      {action: :orders, title: t('account.link.orders')},
    ]
    render partial: 'user/account/menu'
  end

  # -------------------------------------------------------------
  # Is user an admin?
  # -------------------------------------------------------------
  def is_admin?
    !current_user.nil? && current_user.role.class == Sap::Admin
  end

  # -------------------------------------------------------------
  # Is user logged in ?
  # -------------------------------------------------------------
  def logged_in?
    !current_user.nil?
  end

  # -------------------------------------------------------------
  # Get session setting
  # -------------------------------------------------------------
  def get_session_setting(key, default = nil)
    (!session[:settings].nil? && !session[:settings][key.to_sym].nil?) ? session[:settings][key.to_sym] : default
  end

  # -------------------------------------------------------------
  # Set setting to session
  # -------------------------------------------------------------
  def set_session_setting(key, value)
    if session[:settings].nil?
      session[:settings] = {}
    end

    session[:settings][key.to_sym] = value
  end

  # -------------------------------------------------------------
  #
  # -------------------------------------------------------------
  def generate_guset_user_login

  end
end