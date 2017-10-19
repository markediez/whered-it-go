class ChangeFundsToAmount < ActiveRecord::Migration[5.0]
  def change
	rename_column :funds, :funds, :amount
	rename_column :funds, :funds_set_at, :amount_set_at
  end
end
