include SecurityHelper

class User < ApplicationRecord
  before_save :encrypt_password

  private
  def encrypt_password
    self.password = SecurityHelper::encrypt(self.password)
  end
end
