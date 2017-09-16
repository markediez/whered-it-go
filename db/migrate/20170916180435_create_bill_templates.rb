class CreateBillTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :bill_templates do |t|
      t.string :name
      t.float :amount
      t.integer :reminder_template_id
      t.string :url
      t.datetime :triggered_at

      t.timestamps
    end
  end
end
