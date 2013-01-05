# -------------------------------------------------------------
# =Name: AdminController
# =Description:
# Base controller for admin
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   03.01.2012
# -------------------------------------------------------------

class AdminController < ApplicationController
  layout 'admin'
  before_filter :admin_only
  
  private

  # -------------------------------------------------------------
  # =Name: admin_only
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Pages only for admins
  # -------------------------------------------------------------
  def admin_only
    #user = current_user
    #
    #unless user && user.role.class == Sap::Admin
    #raise ActiveResource::ForbiddenAccess.new({:code => 403, :message =>'Forbidden'})
    #end
  end
end
