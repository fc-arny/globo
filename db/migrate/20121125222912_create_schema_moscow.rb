# -------------------------------------------------------------
# =Name: CreateSchemaMoscow
# =Description:
# Add name space for moscow city. Moscow is our first step in the world ;-)
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   25.11.2012
# -------------------------------------------------------------
class CreateSchemaMoscow < ActiveRecord::Migration
	def up
		execute "CREATE SCHEMA moscow"
	end

	def down
		execute "DROP SCHEMA sap"
	end
end
