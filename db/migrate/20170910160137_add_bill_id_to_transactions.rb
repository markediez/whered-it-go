class AddBillIdToTransactions < ActiveRecord::Migration[5.0]
  def change
	add_column :transactions, :bill_id, :integer, default: 0
  end
end
