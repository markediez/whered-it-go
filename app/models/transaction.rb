class Transaction < ApplicationRecord
	belongs_to :category, required: false
	belongs_to :bill, required: false

	PAYMENT_TYPES = %w(PAY EARN CREDIT)
	validates :payment_type, inclusion: { in: PAYMENT_TYPES, message: "${value} is not a valid type" }

	def payment?
		return self.payment_type == "PAY"
	end

	def income?
		return self.payment_type == "EARN"
	end

	def credit?
		return self.payment_type == "CREDIT"
	end
end
