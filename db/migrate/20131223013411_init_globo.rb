class InitGlobo < ActiveRecord::Migration
  def change
    # Create feedback
    create_table :feedbacks, comment: 'FAQ from contacts' do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.text :message, null: false
      t.text :answer
      t.references :user,                     comment: 'Responsible employee'
      t.boolean :show_in_faq, default: false, comment: 'Show or not in help page'
      t.integer :position, default: 0,           comment: 'Order questions in help page'
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
