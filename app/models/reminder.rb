class Reminder < ApplicationRecord
  has_many :bills, dependent: :destroy
  has_many :transactions, through: :bills

end
