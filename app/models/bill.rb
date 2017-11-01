class Bill < ApplicationRecord
  has_many :transactions
  belongs_to :reminder, required: false
  before_validation :add_url_protocol

  def paid?
    total_paid = 0
    self.transactions.each do |transaction|
      total_paid = transaction.payment? ? total_paid + transaction.amount : total_paid - transaction.amount
    end

    return total_paid >= self.amount
  end

  def total_amount
    return self.amount + get_balance(:CREDIT)
  end

  def get_balance(type)
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
