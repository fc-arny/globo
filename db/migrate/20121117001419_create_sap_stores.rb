class CreateSapStores < ActiveRecord::Migration
	def change
		create_table :stores do |t|
			t.integer :id
			t.string :name, null: false
			t.integer :order_pos, default: 0
			t.boolean :is_disabled, default: false
			t.timestamps
		end
	end
end


