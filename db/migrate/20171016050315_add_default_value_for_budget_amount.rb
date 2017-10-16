class AddDefaultValueForBudgetAmount < ActiveRecord::Migration[5.0]
  def change
	change_column :categories, :amount, :float, :default => 0
  end
end
