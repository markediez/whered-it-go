class AddTypeToTransactions < ActiveRecord::Migration[5.0]
  def change
	add_column :transactions, :type, :string, null: false, default: :PAY
  end
end
