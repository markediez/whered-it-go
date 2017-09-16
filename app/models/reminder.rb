class Reminder < ApplicationRecord
  has_many :bills
  has_many :transactions, through: :bills
  
end
