class CreateSapCustomers < ActiveRecord::Migration
  def change
    create_table :"sap.customers" do |t|
      t.integer :user_id, null: false
      t.string :email, null: false
      t.boolean :is_proved, default: false, null: false

      t.timestamps
    end
  end
end
