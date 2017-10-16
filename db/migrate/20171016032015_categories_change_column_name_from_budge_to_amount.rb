class CategoriesChangeColumnNameFromBudgeToAmount < ActiveRecord::Migration[5.0]
  def change
	rename_column :categories, :budget, :amount
  end
end
