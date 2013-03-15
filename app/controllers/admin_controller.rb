# -------------------------------------------------------------
# Base controller for admin
# -------------------------------------------------------------

class AdminController < ApplicationController
  layout 'admin'
  before_filter :admin_only
  
  private

  # -------------------------------------------------------------
  # Pages only for admins
  # -------------------------------------------------------------
  def admin_only
    user = current_user

    unless user && user.role.class == Sap::Admin
      raise Ex, 'Access denied'
    end
  end
end
