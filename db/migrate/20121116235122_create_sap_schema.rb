class CreateSapSchema < ActiveRecord::Migration
  def up
	  execute "CREATE SCHEMA sap"
  end

  def down
	  execute "DROP SCHEMA sap"
  end
end
