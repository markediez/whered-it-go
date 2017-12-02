class RemoveAmountSetAt < ActiveRecord::Migration[5.0]
  def change
	remove_column :funds, :amount_set_at
  end
end
