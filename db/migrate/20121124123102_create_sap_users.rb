# -------------------------------------------------------------
# =Name: CreateSapUsers
# =Description:
# Base table for users
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   24.11.2012
# -------------------------------------------------------------

class CreateSapUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.integer :id
			t.string :name
			t.string :login, null:false
			t.string :password, null:false
			t.string :salt, null:false
			t.string :type, null:false

			t.timestamps
		end
	end
end
