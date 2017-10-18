include SecurityHelper
include SiteHelper

class User < ApplicationRecord
  before_save :encrypt_password

  def balance
    paid = 0
    Transaction.where(:payment_type => :PAY).where(created_at: get_date_range(self.funds_set_at)).map { |t| paid += t.amount }

    earned = 0
    Transaction.where(:payment_type => :EARN).where(created_at: get_date_range(self.funds_set_at)).map { |t| earned += t.amount }

    return self.funds + earned - paid
  end

  private
  def encrypt_password
    self.password = SecurityHelper::encrypt(self.password)
  end
end
