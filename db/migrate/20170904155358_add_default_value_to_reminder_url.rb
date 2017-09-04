class AddDefaultValueToReminderUrl < ActiveRecord::Migration[5.0]
  def change
	change_column_default :reminders, :url, "#"
  end
end
