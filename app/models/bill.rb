class Bill < ApplicationRecord
  has_many :transactions
  belongs_to :reminder, required: false
  before_validation :add_url_protocol


  protected
  def add_url_protocol
    unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//] || self.url == "#"
      self.url = "http://#{self.url}"
    end
  end
end
