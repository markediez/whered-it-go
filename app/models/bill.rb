class Bill < ApplicationRecord
  has_many :transactions
  belongs_to :reminder
end
