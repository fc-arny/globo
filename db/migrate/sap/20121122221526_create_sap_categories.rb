# -------------------------------------------------------------
# =Name: CreateSapCategories
# =Description:
# Create category model
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   23.11.2012
# -------------------------------------------------------------
class CreateSapCategories < ActiveRecord::Migration
	def change
		create_table :"sap.categories" do |t|
			t.integer :id
			t.string :name, null: false
			t.integer :order_pos, default: 0
			t.integer :parent_id, default: nil

			t.timestamps
		end
	end
end
