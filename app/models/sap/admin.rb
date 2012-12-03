# -------------------------------------------------------------
# =Name: Sap::Admin
# =Description:
# GloboMarket's administrator
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   24.11.2012
# -------------------------------------------------------------
# ==Fields:
# city_id  - admin by city or global admin if null
# position - position in company
# user_id  - reference to user
# -------------------------------------------------------------
class Sap::Admin < ActiveRecord::Base
  belongs_to :sap_user, :class_name => 'Sap::User'
  attr_accessible :city_id, :name, :position, :user_id
end
