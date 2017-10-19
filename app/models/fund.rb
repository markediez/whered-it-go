include SiteHelper

class Fund < ApplicationRecord
  def balance
    paid = 0
    Transaction.where(:payment_type => :PAY).where(created_at: get_date_range(self.amount_set_at)).map { |t| paid += t.amount }

    earned = 0
    Transaction.where(:payment_type => :EARN).where(created_at: get_date_range(self.amount_set_at)).map { |t| earned += t.amount }

    return self.amount + earned - paid
  end
end
