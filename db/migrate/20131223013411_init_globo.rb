class InitGlobo < ActiveRecord::Migration
  def change
    # Create feedback
    create_table :feedbacks do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.text :message, null: false
      t.text :answer
      t.references :user
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
