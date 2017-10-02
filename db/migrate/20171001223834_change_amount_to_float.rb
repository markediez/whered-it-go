class ChangeAmountToFloat < ActiveRecord::Migration[5.0]
  def change
	change_column :transactions, :amount, :float
  end
end
