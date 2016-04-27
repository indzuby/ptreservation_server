class User < ActiveRecord::Base
  has_many :token

  before_create :set_encryption

  before_update :set_encryption

  def set_encryption
    self.password = Digest::SHA1.hexdigest(self.password)
  end

  def self.authenticate(email,password)
    usr = find_by(email: email)
    if usr != nil && usr.password == Digest::SHA1.hexdigest(password) then
      usr
    else
      return
    end
  end
end
