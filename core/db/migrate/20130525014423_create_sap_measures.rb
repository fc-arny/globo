class CreateSapMeasures < ActiveRecord::Migration
  def up
    create_table :sap_measures do |t|

      t.string  :name, null: false
      t.integer :step, null: false
      t.integer :value_in_parent
      t.integer :parent_id
    end

    add_foreign_key :sap_measures, :sap_measures, column: :parent_id
    add_foreign_key :sap_goods, :sap_measures, column: :measure_id

    Sap::Measure.create :id => 1, :name => 'gram', :step => 100
    Sap::Measure.create :id => 3, :name => 'piece', :step => 1
  end

  def down
    drop_table :sap_measures
  end
end
