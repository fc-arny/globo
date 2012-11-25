# -------------------------------------------------------------
# =Name: CreateSapSchema
# =Description:
# NS for base tabled
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   17.11.2012
# -------------------------------------------------------------
class CreateSapSchema < ActiveRecord::Migration
	def up
		execute "CREATE SCHEMA sap"
	end

	def down
		execute "DROP SCHEMA sap"
	end
end
