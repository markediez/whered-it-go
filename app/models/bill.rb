class Bill < ApplicationRecord
  has_many :transactions
  belongs_to :reminder, required: false
  before_validation :add_url_protocol

  def paid?
    return self.amount.nil? ? false : balance <= 0
  end

  def balance
    balance = self.amount
    self.transactions.each do |t|
      if t.credit?
        balance += t.amount
      else
        balance -= t.amount
      end
    end

    return balance
  end

  def total_amount
    return self.amount + get_amount(:CREDIT)
  end

  def get_amount(type)
    type = type.to_s
    raise ArgumentError.new "Invalid 'type' #{type} must be :PAY | :EARN | :CREDIT" unless Transaction::PAYMENT_TYPES.include? type

    balance = 0
    self.transactions.where(:payment_type => type).map { |t| balance += t.amount }

    return balance
  end

  protected
  def add_url_protocol
    unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//] || self.url == "#"
      self.url = "http://#{self.url}"
    end
  end
end
