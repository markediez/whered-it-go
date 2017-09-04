class AddDefaultToStatusAndArchived < ActiveRecord::Migration[5.0]
  def change
	change_column_default :reminders, :archived, false
	change_column_default :reminders, :status, false
  end
end
