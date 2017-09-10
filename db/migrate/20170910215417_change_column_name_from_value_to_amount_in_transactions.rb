class ChangeColumnNameFromValueToAmountInTransactions < ActiveRecord::Migration[5.0]
  def change
	change_column :transactions, :value, :amount
  end
end
