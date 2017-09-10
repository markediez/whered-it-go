class ChangeColumnNameInTransactionsFromValueToAmount < ActiveRecord::Migration[5.0]
  def change
	rename_column :transactions, :value, :amount
  end
end
