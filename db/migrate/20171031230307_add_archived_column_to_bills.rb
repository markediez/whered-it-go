class AddArchivedColumnToBills < ActiveRecord::Migration[5.0]
  def change
	add_column :bills, :archived, :boolean, :default => false, :after => :id
  end
end
