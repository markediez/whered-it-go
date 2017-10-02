class Category < ApplicationRecord
	include SiteHelper
	has_many :transactions

	def funds
		return nil if self.budget.nil? 

		transactions = Transaction.where({
			:created_at => DateTime.now.beginning_of_month..DateTime.now.end_of_month,
			:payment_type => :PAY,
			:category_id => self.id
		})

		return self.budget - transactions.inject(0){ |spent, t| spent + t.amount }
	end
end
