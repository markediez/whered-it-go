class Category < ApplicationRecord
	include SiteHelper
	has_many :transactions

	validates :category_type, inclusion: { in: %w(BUDGET GOAL), message: "${value} is not a valid type" }

	def funds
		transactions = Transaction.where({
			:created_at => DateTime.now.beginning_of_month..DateTime.now.end_of_month,
			:category_id => self.id
		})

		activity = 0
		transactions.each do |t|
			activity += t.amount if t.payment_type == "PAY"
			activity -= t.amount if t.payment_type == "EARN"
		end

		return self.amount - activity
	end
end
