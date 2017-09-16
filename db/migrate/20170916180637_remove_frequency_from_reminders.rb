class RemoveFrequencyFromReminders < ActiveRecord::Migration[5.0]
  def change
	remove_column :reminders, :frequency
  end
end
