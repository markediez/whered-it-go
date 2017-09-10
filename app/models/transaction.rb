class Transaction < ApplicationRecord
	belongs_to :category
	belongs_to :bill

	validates :payment_type, inclusion: { in: %w(PAY EARN), message: "${value} is not a valid type" }
end
