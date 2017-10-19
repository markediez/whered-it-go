class ChangeUserToFund < ActiveRecord::Migration[5.0]
  def change
	rename_table :users, :funds
  end
end
