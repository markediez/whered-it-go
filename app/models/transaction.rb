class Transaction < ApplicationRecord
	belongs_to :category
	belongs_to :bill, required: false

	validates :payment_type, inclusion: { in: %w(PAY EARN), message: "${value} is not a valid type" }

	def payment?
		return self.payment_type == "PAY"
	end
end
