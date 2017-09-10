class MoveLinkColumnFromRemindersToBills < ActiveRecord::Migration[5.0]
  def change
	remove_column :reminders, :url
	add_column :bills, :url, :string, default: "#"
  end
end
