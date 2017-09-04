class ChangeColumnNameOnTransactionsFromTypeToPaymentType < ActiveRecord::Migration[5.0]
  def change
	rename_column :transactions, :type, :payment_type
  end
end
