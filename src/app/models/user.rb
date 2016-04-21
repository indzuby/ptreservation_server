class User < ActiveRecord::Base
  has_many :token

  before_create :set_encryption

  before_update :set_encryption

  def set_encryption
    self.password = Digest::SHA1.hexdigest(self.password)
  end
end
