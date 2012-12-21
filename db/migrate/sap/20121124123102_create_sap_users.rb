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
    create_table :"sap.users" do |t|
      t.integer :id
      t.string :name, null:false
      t.string :login, null:false
      t.string :password, null:false
      t.string :salt, null:false

      t.string :token
      t.datetime :valid_token_to

      t.references :role, :polymorphic => true

      t.timestamps
    end
  end
end
