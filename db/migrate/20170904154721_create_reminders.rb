class CreateReminders < ActiveRecord::Migration[5.0]
  def change
    create_table :reminders do |t|
      t.string :name
      t.string :url
      t.string :frequency
      t.boolean :archived, null: false, default: false
      t.boolean :status, null: false, default: false

      t.timestamps
    end
  end
end
