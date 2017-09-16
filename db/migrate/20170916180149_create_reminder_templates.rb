class CreateReminderTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :reminder_templates do |t|
      t.string :name
      t.string :frequency
      t.datetime :triggered_at

      t.timestamps
    end
  end
end
