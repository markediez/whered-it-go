include SiteHelper

class Fund < ApplicationRecord
  def total_balance
    paid = get_balance :PAY
    earned = get_balance :EARN

    return self.amount + earned - paid
  end

  def get_balance(type)
    type = type.to_s
    raise ArgumentError.new "Invalid 'type' #{type} must be :PAY | :EARN | :CREDIT" unless Transaction::PAYMENT_TYPES.include? type

    balance = 0
    Transaction.where(:payment_type => type).where(created_at: get_date_range(self.updated_at)).map { |t| balance += t.amount }

    return balance
  end
end
