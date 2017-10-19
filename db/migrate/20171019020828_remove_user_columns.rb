class RemoveUserColumns < ActiveRecord::Migration[5.0]
  def change
	remove_column :funds, :email
	remove_column :funds, :password
  end
end
