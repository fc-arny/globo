# -------------------------------------------------------------
# =Name: CreateSapSchema
# =Description:
# Create Postgre schema SAP
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   07.12.2012
# -------------------------------------------------------------
class CreateSapSchema < ActiveRecord::Migration
  def up
    #transaction do
      execute "CREATE SCHEMA sap"
    #end
  end

  def down
    transaction do
      execute "DROP SCHEMA sap"
    end
  end
end