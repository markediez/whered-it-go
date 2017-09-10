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

  protected
  def add_url_protocol
    unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//] || self.url == "#"
      self.url = "http://#{self.url}"
    end
  end
end
