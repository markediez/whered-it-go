class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, :unique => true, :null => false
      t.string :password, :null => false
      t.float :funds, :default => 0
      t.datetime :funds_set_at, :default => DateTime.now

      t.timestamps
    end
  end
end
