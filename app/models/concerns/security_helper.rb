require 'base64'

module SecurityHelper
  def encrypt(str)
    return Base64.encode64 str
  end

  def decrypt(str)
    return Base64.decode64 str
  end
end
