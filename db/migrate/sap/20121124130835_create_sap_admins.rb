# -------------------------------------------------------------
# =Name: CreateSapAdmins
# =Description:
# GloboMarket's administrator table
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   24.11.2012
# -------------------------------------------------------------
class CreateSapAdmins < ActiveRecord::Migration
	def change
		create_table :"sap.admins" do |t|
			t.integer :user_id, null:false
			t.integer :city_id
			t.string :name, null:false
			t.string :position

			t.timestamps
		end
	end
end
