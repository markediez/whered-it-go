class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.string :name
      t.float :amount
      t.integer :reminder_id

      t.timestamps
    end
  end
end
