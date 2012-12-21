# -------------------------------------------------------------
# =Name: CreateSapManagers
# =Description:
# Store's manager tagle
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   26.11.2012
# -------------------------------------------------------------
class CreateSapManagers < ActiveRecord::Migration
	def change
		create_table :"sap.managers" do |t|
			t.integer :store_id, null:false
			t.integer :last_name, null:false
			t.integer :first_name, null:false

			t.timestamps
		end
  end
end
