class CreateSapRoles < ActiveRecord::Migration
  def up
    create_table :"sap.roles" do |t|
      t.integer :id
      t.string :class_name
      t.text :description
    end

    # Add base roles
    Sap::Role.create([
        {:class_name => Sap::Role::R_ADMIN},
        {:class_name => Sap::Role::R_CUSTOMER},
        {:class_name => Sap::Role::R_MANAGER}
    ])
  end
  def down
    drop_table :"sap.roles"
  end
end
